require 'rest-client'
require 'json'



module API


	def self.get_json(url)
	
		json = RestClient.get(url)
		return JSON.parse(json)

	end

end

#json = RestClient.get('https://www.reddit.com/.json')
#json_hash = JSON.parse(json)
# puts json_hash
#puts json_hash["data"]["children"][i]["data"]["author"]
#API.reddit_params(0)

