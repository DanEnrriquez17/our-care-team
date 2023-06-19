class EnvController < ApplicationController

  def get_mapbox_api
    @mapbox_key = ENV["MAPBOX_TOKEN"]
  end

end
