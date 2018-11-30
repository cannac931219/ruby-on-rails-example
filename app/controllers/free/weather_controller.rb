END {
	p 'end +++++++'
}
BEGIN {
	p 'start +++++++'
}

class Free::WeatherController < FreeController
	require 'json'
  require 'openssl'
  require 'base64'
  require 'net/http'
  require 'net/https'

  before_action :before_update_action
  # before_update :before_update_action #报错？？？

	def index
		city = params[:city]
		if !city.blank?
			@city_weather = Weather.where('city = ?', params[:city]).first
			weather_search = WeatherGet.new
			getWeather = weather_search.get_city_weather(city)
			if getWeather['status'] == 200
				getWeatherAll = getWeather
				getWeatherData = getWeather['data']['forecast'][0]
				p '-------'
				# p getWeatherAll
				p '********'
				city = getWeatherAll['city']
				high = getWeatherData['high']
				low = getWeatherData['low']
				@city_weather_response = getWeather
				create_data(city, high, low)
			end
		else 
			city = '北京'
			weather_search = WeatherGet.new
			getWeather = weather_search.get_city_weather(city)
			@city_weather_response = getWeather
		end
	end

	def create_data(a, b, c)
		raise 'CITY值不为空' if !a.blank?
		weather_city = Weather.where('city = ?', a)
		weather_city_length = weather_city.length
		weather_city.transaction do
			if weather_city_length != 0
				weather_city.update({
				:city => a,
				:high => b,
				:low  => c
			})
			else
				Weather.create!({
				:city => a,
				:high => b,
				:low  => c
			})
			end
		end
		# rescue 后跟随的runtime运行时间错误 必须给 =>e 不然就会报错 RuntimeError
		rescue RuntimeError => e
		p e.message
		render '/free/weather/index'
	end



	private
	def before_update_action
		if !params[:city].blank?
			p '--------------------'
			p  "#{params[:city]}city参数不为空"'before_update_action'
			p '--------------------'
		end
	end

end

