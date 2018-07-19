require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/townhalls_scrapper.rb'
require 'app/townhalls_adder_to_db.rb'
require 'views/index.rb'
require 'views/done.rb'

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'csv'

index = Index.new