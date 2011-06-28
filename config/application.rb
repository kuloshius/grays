require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module Grays
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    if Rails.env.test? 
      initializer :after => :initialize_dependency_mechanism do 
        ActiveSupport::Dependencies.mechanism = :load 
      end 
    end 
  end
end
