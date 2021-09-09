require 'json'
require 'open-uri'

class MuseumsController < ApplicationController

  def index
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{params[:lng]},#{params[:lat]}&limit=7&access_token=#{ENV['MAPBOX_API_KEY']}"
    museums = URI.open(url)
    @museums = JSON.parse(museums.read)


    puts "#{@museums}"
  end
end
