require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.api_only = true

#    config.autoload_paths += %W(
    #{config.root}/lib/
#    )
#    config.eager_load_paths << "#{config.root}/lib"
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Asia/Kuala_Lumpur'

    config.active_record.time_zone_aware_types = [:datetime, :time]
    
  end
end
