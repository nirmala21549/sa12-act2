require 'httparty'
require 'json'

def convert_world_time(area, location)
  response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
  time_info = JSON.parse(response.body)

  current_time = DateTime.parse(time_info['datetime'])
  puts "The current time in #{area}/#{location} is #{current_time.strftime('%Y-%m-%d %H:%M:%S')}"
end

convert_world_time("Europe", "London")
