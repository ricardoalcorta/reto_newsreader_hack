require_relative 'api'

class News
	include API

	def initialize
		@json_reddit_hash = API.get_json('https://www.reddit.com/.json')
		@json_mashable_hash = API.get_json ('http://mashable.com/stories.json')
		@json_digg_hash = API.get_json ('http://digg.com/api/news/popular.json')
		
		@@reddit_inarrey_length = @json_reddit_hash["data"]["children"].length
		@@mashable_inarrey_length = @json_mashable_hash["rising"].length
		@@digg_inarrey_length = @json_digg_hash["data"]["feed"].length
	
	end

	def jsons_item (i)

		arrey_of_size = [@@reddit_inarrey_length, @@mashable_inarrey_length, @@digg_inarrey_length]
		return arrey_of_size[i]
		
	end

	def reddit_params (i)

		@title = @json_reddit_hash["data"]["children"][i]["data"]["title"]
		@author = @json_reddit_hash["data"]["children"][i]["data"]["author"]
		@aux_date = Time.at(@json_reddit_hash["data"]["children"][i]["data"]["created"])  #.strftime("%d/%m/%Y")
		@date = [@aux_date.day.to_i, @aux_date.month.to_i, @aux_date.year.to_i, @aux_date.hour.to_i]
		@url = @json_reddit_hash["data"]["children"][i]["data"]["url"]
		@one_news_arrey = [@title, @author, @date, @url, 1]
		return @one_news_arrey

	end

	def mashable_params (i)

		@title = @json_mashable_hash["rising"][i]["title"]
		@author = @json_mashable_hash["rising"][i]["author"]
		@aux_date = @json_mashable_hash["rising"][i]["post_date"].split('T')[1].split(':',0)
		#puts @aux_date
		@date = @json_mashable_hash["rising"][i]["post_date"].split('T')[0].split('-',3).reverse.map! { |item| item.to_i }
		@url = @json_mashable_hash["rising"][i]["link"]
		@one_news_arrey = [@title, @author, @date, @url, 2]
		return @one_news_arrey

	end

	def digg_params (i)

		@title = @json_digg_hash["data"]["feed"][i]["content"]["title"]
		@author = @json_digg_hash["data"]["feed"][i]["content"]["author"]
		@aux_date = Time.at(@json_digg_hash["data"]["feed"][i]["date_published"]) #.strftime("%d/%m/%Y")
		@date = [@aux_date.day.to_i, @aux_date.month.to_i, @aux_date.year.to_i, @aux_date.hour.to_i]
		@url = @json_digg_hash["data"]["feed"][i]["content"]["url"]
		@one_news_arrey = [@title, @author, @date, @url, 3]
		return @one_news_arrey

	end

end

