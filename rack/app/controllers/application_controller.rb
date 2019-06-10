class ApplicationController < ActionController::API
  protected

  def errors_json(messages)
    {
      errors: messages.map do |k, v|
        v.compact! if v.is_a?(Array)
        Hash[:key, k, :message, v]
      end
    }
  end
end
