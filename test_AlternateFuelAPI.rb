require 'rest_client'
require 'json'


#make the API request
response = RestClient.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=5hZ2CqMNrba6VWdBXTialoJvbZDzyZW7S2A7K7PA&location=Austin+TX&ev_network=ChargePoint%20Network")

#parse the json
@data = JSON.parse response.body

#verify some data returned
if !@data
    puts "Test Failed - no data returned"
    exit
end

#find the entry for HYATT AUSTIN
@data['fuel_stations'].each do |i|
    if i['station_name'] == 'HYATT AUSTIN'
        @subhash = i
    end
end

#verify HYATT AUSTIN entry was found
if @subhash
    puts "Test Passed - HYATT AUSTIN found in results"
else
    puts "Test Failed - station HYATT AUSTIN not found"
    exit
end

#assemble a string for station address
station_address = "#{@subhash['street_address']}" + ", " + "#{@subhash['city']}" + ", " + "#{@subhash['state']}" + ", " + "#{@subhash['zip']}"

#verify station address is as expected
if station_address == "208 Barton Springs Rd, Austin, TX, 78704"
	puts "Test Passed - Address is correct"
else
	puts "Test Failed - Expected Address: 208 Barton Springs Rd, Austin, TX, 78704, Actual: " + "#{station_address}"
end