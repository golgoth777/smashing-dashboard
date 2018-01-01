require 'httparty'
 
require 'json'
 
SCHEDULER.every '1m', :first_in => 0 do |job|
 
words = ["system.cpu", "ram.used", "ram.free", "system.iowait", "system.load"]
 
#url = "http://remote.nicolleau.eu:19999/v1/gifs/search?q="+ word +"&api_key=dc6zaTOxFJmzC&limit=100"
for word in words
url = "http://remote.nicolleau.eu:19999/api/v1/chart?chart="+ word +"&after=-10&group=average"
send_event('netdata_rpi1', {current: getSvg(url)})
end
 
end
 
def getSvg(apiUrl)
res = HTTParty.get(apiUrl)
return res["data"]
end
 
