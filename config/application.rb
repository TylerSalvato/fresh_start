require_relative "boot"

require "rails"
require "rails/all"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FreshStart
  class Application < Rails::Application
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Flash
    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Session::CookieStore, key: 'fresh_start'
    

    config.api_only = false

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3000', 'http://localhost:3001'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
      end
        
      allow do
        # Additional resource block for '/auth/*'
        origins 'http://localhost:3001'
        resource '/auth/*', headers: :any, methods: [:post], credentials: true
      end
    end

    config.autoload_paths << Rails.root.join('app', 'controllers')


    config.ignore_pattern = %r{/favicon.ico}
    config.session_store :cookie_store, key: '_fresh_start_session', expire_after: 30.minutes

        # Exclude the 'app/models/user.rb' file from Zeitwerk autoload
        config.autoload_paths -= ["#{config.root}/app/models/user.rb"]
    
        # Exclude the 'app/models' directory from Zeitwerk eager loading
        config.eager_load_paths -= ["#{config.root}/app/models"]
      
    
    
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.

    
    config.generators do |g|
      g.template_engine :erb
      g.test_framework  :test_unit, fixture: false
      g.stylesheets     false
      g.javascripts     false
      g.helper          false
      g.assets          false

      # Add Devise generator
      g.devise :install
    end


  end
end
