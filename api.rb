require 'rest-client'
require 'json'



module API


	def self.get_json(url)
	
		json = RestClient.get(url)
		return JSON.parse(json)

	end

end


