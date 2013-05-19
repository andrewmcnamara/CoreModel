# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler'
Bundler.setup :default, :development
Bundler.require


Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'CoreModel'
  app.files = Dir.glob('./lib/core_model/**/*.rb')
  app.files = (app.files + Dir.glob('./app/**/*.rb'))
  app.frameworks += %w{ CoreData }
end


