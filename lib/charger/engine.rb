module Charger
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    require 'jbuilder'
    require 'friendly_id'
    isolate_namespace Charger

    # Use Rspec for tests
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    initializer :charger do |app|
      # Expand App migrate path
      #unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      #end

      # Define Active Admin resource path if is defined
      if defined?(ActiveAdmin)
        ActiveAdmin.application.load_paths.unshift File.dirname(__FILE__) + '/../admin'
      end
    end

    
  end
end
