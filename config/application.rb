require_relative 'boot'

require 'csv'
require 'iconv'
require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Elune
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << "#{config.root}/lib"
    config.i18n.default_locale=:'zh-CN'
    config.cache_store = :redis_cache_store, 'redis://localhost:6379/0', { expires_in: 2.minutes }
  end
end
