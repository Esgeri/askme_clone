require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AskmeClone
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Almaty'

    config.i18n.default_locale = :ru
    config.i18n.locale = :en

    config.i18n.fallbacks = [:en]

    config.generators do |g|
      g.test_framework :rspec,
                                    fixtures: true,
                                    view_spec: false,
                                    helper_specs: false,
                                    routing_specs: false,
                                    request_specs: false,
                                    controller_spec: true
      g.fixture_replacement :factory_bot_rails, dir: 'spec/factories'
    end
  end
end
