# Purpose - When companies change status from IPO to listed, we want to keep a record of their
# share price.  The purpose of this is so we can display this price in the newsletter.
# We only want to display up to 12 months worth of companies that have made this transition.


# This will update the records in the IpoListing table with current share price.

# STEP ONE: DONE!
# Listings - contains current IPO
# We need a way of knowing if a company changes status from IPO to listed.
# When records are written to Listings, they are also written to Asxlistings, however,
# Asxlistings isn't deleted prior to each run like Listings is.
#



# STEP TWO:
# We read through Asxlistings and try and get the current price for each record.
# 

require 'uri'
require 'net/http'
require 'json'

#url = URI("https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/v2/get-quotes?region=AU&symbols=BHP")
url = URI("https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-summary?symbol=BHP.AX&region=AU")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = '1b1ba0e8bemsh0a028e0a070b60ap162ba9jsnba30da90801d'
request["X-RapidAPI-Host"] = 'apidojo-yahoo-finance-v1.p.rapidapi.com'

response = http.request(request)
newHash = response.read_body
#puts newHash


for response.each_key do | key |
    puts key
end


#data = JSON.parse('newHash')

#previous_close = data['summaryDetail']

#puts "Previous Close: #{previous_close}"







@asxlistings = Asxlisting.all   # Fetch all entries
 
@asxlistings.each do | asxlisting |     # Loop through each entry.
#    puts asxlisting.code

        


end

# STEP THREE:
# When it comes time to send out the newsletter, we read through Asxlistings but only extract
# records that have a current price.  This means they are listed companies.