class Urls::Show < Mutations::Command
  DEFAULT_REDIRECT_URL = ::DEFAULT_REDIRECT_URL
  required do
    string :short_url_hash
  end

  def execute
    original_url
  end

  private

  def original_url
    url = Url.find_by_short_url_hash(short_url_hash)
    url&.original_url.present? ? url.original_url : DEFAULT_REDIRECT_URL
  end
end