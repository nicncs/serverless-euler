class Url < ApplicationRecord
    include Rails.application.routes.url_helpers
    
    HOST = ::HOST
  validates_uniqueness_of :short_url_hash
  validate :validate_url_format

  def short_url
    shortened_url(host: HOST, id: short_url_hash)
  end

  private

  def validate_url_format
    uri = URI.parse(original_url)
    errors.add(:format, 'invalid url format') unless uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    errors.add(:format, 'invalid url format')
  end
  
end
