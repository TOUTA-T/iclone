require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Iclone
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators do |g|
    g.assets false
    g.helper false
    g.jbuilder false
    g.javascripts false
    g.helper false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
  end
end
