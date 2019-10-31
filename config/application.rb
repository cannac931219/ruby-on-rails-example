require_relative 'boot'
# require File.expand_path('../boot', __FILE__)

require 'rails/all'

# require './lib/middleware/consider_all_request_json_middleware'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Egg
  class Application < Rails::Application
    config.assets.precompile += %w( .svg .eot .woff .ttf )
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 5.2
    
  #   config.active_record.default_timezone = :local
		# config.time_zone = 'Beijing'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.autoload_paths += %W(#{config.root}/lib)

    # config.middleware.insert_before(ActionDispatch::Static,ConsiderAllRequestJsonMiddleware)
  end
end
