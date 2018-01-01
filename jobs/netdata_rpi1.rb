require 'httparty'
 
require 'json'
 
SCHEDULER.every '1m', :first_in => 0 do |job|

servers = ["remote.nicolleau.eu:19999","remote.nicolleau.eu:29999","remote.nicolleau.eu:39999","remote.nicolleau.eu:49999","remote.nicolleau.eu:59999"]
words = ["system.cpu", "system.used", "system.entropy", "system.iowait", "system.load"]
 
#url = "http://remote.nicolleau.eu:19999/v1/gifs/search?q="+ word +"&api_key=dc6zaTOxFJmzC&limit=100"
  #for i in servers.length()
	for server in servers
		for word in words
			url = "http://"+ server +"/api/v1/data?chart="+ word +"&after=-10&group=average"
			send_event('netdata_rpi1', {current: getSvg(url)})
		end
	end
  #end
end
 
def getSvg(apiUrl)
res = HTTParty.get(apiUrl)
return res["data"]
end
 
