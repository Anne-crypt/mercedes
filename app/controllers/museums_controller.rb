require 'json'
require 'open-uri'

class MuseumsController < ApplicationController

  def index
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{params[:lng]},#{params[:lat]}&limit=7&access_token=#{ENV['MAPBOX_API_KEY']}"
    museums = URI.open(url)
    @museums = JSON.parse(museums.read)

    result = []
    @museums["features"].each do |museum|
      postcode = museum["context"][0]["text"]
      name = museum["text"]
      @result = result << postcode + " " + name
    end
  end
end
