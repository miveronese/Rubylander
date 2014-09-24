require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'dotenv' ; Dotenv.load

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tutorial
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    # config.assets.initialize_on_precompile = false
    # config.serve_static_assets = true
    config.secret_key_base = "da9461981b2f9b421c3c9f8da9ae6b2b8618cbaf8f3cac713269aa1335b10fe7ac5bf48aa8827b776f9c1e4fd4de82bd8676a8c80ae968839de97355e918afcc"
    config.assets.paths << "#{Rails}/vendor/assets/fonts"

  end
end
