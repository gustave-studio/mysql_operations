require 'json'
require 'open-uri'

class WeatherReportImporter
  API_KEY = ENV['WEATHER_REPORT_API_KEY']
  BASE_URL = 'http://api.openweathermap.org/data/2.5/weather'
  HOST = ENV['MYSQL_OPERATIONS_HOST']
  USERNAME = ENV['MYSQL_OPERATIONS_USER']
  PASSWORD = ENV['MYSQL_OPERATIONS_PASSWORD']
  DATABASE = ENV['WEATHER_REPORT_DB']
  SSLCA = ENV['MYSQL_OPERATIONS_SSLCA']

  class << self
    def get
      response = URI.open("#{BASE_URL}?id=1850147&units=metric&APPID=#{API_KEY}")
      response_list = JSON.parse(response.read)
      weather = response_list['weather'][0]['main']
      city = response_list['name']
      client = Mysql2::Client.new(host: HOST,
                                  username: USERNAME,
                                  password: PASSWORD,
                                  database: DATABASE,
                                  ssl_mode: :verify_identity,
                                  sslca: SSLCA)
      sql = "INSERT INTO weather(weather, city) VALUES('#{weather}', '#{city}');"

      client.query(sql)
    end
  end
end