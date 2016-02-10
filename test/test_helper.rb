ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'capybara'
require 'database_cleaner'

Capybara.app = FilmFile

DatabaseCleaner.strategy = :truncation, {except: %w[public.schema_migrations]} #don't want db cleaner to clean out schema_migrations
