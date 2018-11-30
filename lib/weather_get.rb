require 'nokogiri'
class WeatherGet
	def initialize
    @weather_config = Rails.application.config.weather
  end
  
  def unicode_utf8(unicode_string) 
    unicode_string.gsub(/\\u\w{4}/) do |s| 
      str = s.sub(/\\u/, "").hex.to_s(2) 
      if str.length < 8 
        CGI.unescape(str.to_i(2).to_s(16).insert(0, "%")) 
      else 
        arr = str.reverse.scan(/\w{0,6}/).reverse.select{|a| a != ""}.map{|b| b.reverse} 
        hex = lambda do |s| 
          (arr.first == s ? "1" * arr.length + "0" * (8 - arr.length - s.length) + s : "10" + s).to_i(2).to_s(16).insert(0, "%") 
        end 
        CGI.unescape(arr.map(&hex).join) 
      end 
    end 
  end 

  def get_city_weather(data)
    uri_encode = data.encode('utf-8')  
    config = @weather_config['api_base']
    url = config + '?city=' + uri_encode
                                                  # !!! URI must to ascii ↓
    uri = URI.parse(URI.escape(url))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true                           #!!!
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    p '---------'
    p uri.request_uri
    # uri #<URI::HTTPS https://www.sojson.com/open/api/weather/json.shtml?city=%E5%A4%A9%E6%B4%A5>
    #          www.sojson.com =》 host；  443 =》 port
    #          uri.request_uri => "/open/api/weather/json.shtml?city=%E5%A4%A9%E6%B4%A5"
    # p JSON.parse(response.body)
    p '---------'
    # !!!ASCII-8BIT to UTF-8 ↓
    response_body = JSON.parse(response.body)
    return response_body
    # return JSON.parse(response.body)

  end
end





# 
# URI.parse(uri_str)
# 用所给URI生成并返回相对应的URI子类的实例。

# require 'uri'
# p uri = URI.parse("http://www.ruby-lang.org/")

# # => #<URI::HTTP:0x201002a6 URL:http://www.ruby-lang.org/>
# p uri.scheme    # => "http"
# p uri.host      # => "www.ruby-lang.org"
# p uri.port      # => 80
# p uri.path      # => "/"