require_relative 'api'
require_relative 'news'


class Main

	def initialize

		reddit = News.new
		reddit.reddit_params(0)
		
	end
end

Main.new