class UrlsController < ApplicationController

  # GET /urls/short_url_hash

  def show
    url = Url.find_by(short_url_hash: params[:id])
    if url&.original_url.present?
#      render json: urls.original_url.to_s
      redirect_to url.original_url, status: :moved_permanently
    else
      redirect_to "https://www.kaodim.com", status: :moved_permanently 
    end
  end
    
    
end
