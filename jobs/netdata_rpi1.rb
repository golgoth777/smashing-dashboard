require 'httparty'
 
require 'json'
 
SCHEDULER.every '1m', :first_in => 0 do |job|
 
words = ["system.cpu", "ram.used", "ram.free", "system.iowait", "system.load"]
 
#url = "http://remote.nicolleau.eu:19999/v1/gifs/search?q="+ word +"&api_key=dc6zaTOxFJmzC&limit=100"
for word in words
url = "http://remote.nicolleau.eu:19999/api/v1/data?chart="+ word +"&after=-60&group=average"
send_event('netdata_rpi1', {title: word, netdata-rpi1: getSvg(url)})
loop
 
end
 
def getSvg(apiUrl)
res = HTTParty.get(apiUrl)
list = res["data"]
return getItem(list)["images"]["original"]["url"]
end
 
