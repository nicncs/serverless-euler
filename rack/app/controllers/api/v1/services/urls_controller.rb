class Api::V1::Services::UrlsController < Api::V1::ApiController
#  before_action :set_api_v1_services_url, only: [:show, :update, :destroy]


  # POST /api/v1/services/urls
  # POST /api/v1/services/urls.json
  def create
#    @url = Url.new(short_url_hash: "234234", original_url: params[:url])
    update_url && url

    if @url.save
      render json: {shortened_url: @url.short_url_hash}, status: :created

    else
      render json: errors_json(@url.errors), status: :unprocessable_entity
    end
  end
  
  private

  def url
    @url ||= Url.find_or_initialize_by(original_url: params[:url]).tap do |u|
      if u.new_record?
        u.short_url_hash = SecureRandom.hex(8) 
      else
        u.short_url_hash
      end
    end
  end

  def update_url
    return true unless url.new_record?
    url.save
  end


end
