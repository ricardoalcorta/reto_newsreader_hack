
module Printit 

	def self.print_news(one_news_arrey)
	
		puts "NEW TITLE: #{one_news_arrey [0]}"
		puts "NEW AUTHOR: #{one_news_arrey [1]}"
		puts "NEW DATE: #{one_news_arrey [2][0]}/#{one_news_arrey [2][1]}/#{one_news_arrey [2][2]}"
		puts "NEW URL: #{one_news_arrey [3]}"
		puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

	end


end
