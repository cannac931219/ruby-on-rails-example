class V1::WeatherController < ApplicationController
	def index
		weather_all = Weather.all
		render :json => {
			:data => weather_all
		}
	end
end
