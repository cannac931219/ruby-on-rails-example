class Weather < ApplicationRecord
	def self.weather_data
		datas = Weather.all
	end
end
