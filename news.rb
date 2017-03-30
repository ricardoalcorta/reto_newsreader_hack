require_relative 'api'

class News
	include API

	def initialize
		@json_reddit_hash = API.get_json('https://www.reddit.com/.json')
		#@json_mashable_hash = API.get_jason ('http://mashable.com/stories.json')
		#@json_digg_hash = API.get_jason ('http://digg.com/api/news/popular.json')
	
	end

	def reddit_params (i)

			puts @title = @json_reddit_hash["data"]["children"][i]["data"]["title"]

			puts @author = @json_reddit_hash["data"]["children"][i]["data"]["author"]

			puts @date = Time.at(@json_reddit_hash["data"]["children"][i]["data"]["created"])

			puts @url = @json_reddit_hash["data"]["children"][i]["data"]["url"]
			
			puts @date.strftime("%d/ %m / %Y")
	end

end

