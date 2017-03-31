require_relative 'api'
require_relative 'news'
require_relative 'printit'

class Main
	include API
	include Printit

	def initialize

		while true
			
			puts "<<Introduzca 1 para noticias de REDDIT, 2 para MASHABLE, 3 para DIGG"
			puts " 4 para TODAS por orden de FECHA, CUALQUIER OTRA para SALIR>>\n"

			STDOUT.flush
			option = gets.chomp.to_i
			option < 5 && option > 0 ? news = News.new : exit!

			case option


			when 1

				system ('clear')
				reddit_inarrey_length = news.jsons_item (0)

				for i in 0..reddit_inarrey_length - 1 do
					one_news_arrey = news.reddit_params (i)
					puts "REDDIT NEWS"
					Printit.print_news (one_news_arrey)
					# puts "NEW TITLE: #{one_news_arrey [0]}"
					# puts "NEW AUTHOR: #{one_news_arrey [1]}"
					# puts "NEW DATE: #{one_news_arrey [2][0]}/#{one_news_arrey [2][1]}/#{one_news_arrey [2][2]}"
					# puts "NEW URL: #{one_news_arrey [3]}"
					# puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
				end


			when 2

				system ('clear')
				mashable_inarrey_length = news.jsons_item (1)

				for i in 0..mashable_inarrey_length - 1 do
					one_news_arrey = news.mashable_params (i)
					puts "MASHABLE NEWS"
					Printit.print_news (one_news_arrey)
					# puts "NEW TITLE: #{one_news_arrey [0]}"
					# puts "NEW AUTHOR: #{one_news_arrey [1]}"
					# puts "NEW DATE: #{one_news_arrey [2][0]}/#{one_news_arrey [2][1]}/#{one_news_arrey [2][2]}"
					# puts "NEW URL: #{one_news_arrey [3]}"
					# puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
				end

			when 3

				system ('clear')
				digg_inarrey_length = news.jsons_item (2)

				for i in 0..digg_inarrey_length - 1 do
					one_news_arrey = news.digg_params (i)
					puts "DIGG NEWS"
					Printit.print_news (one_news_arrey)
					# puts "NEW TITLE: #{one_news_arrey [0]}"
					# puts "NEW AUTHOR: #{one_news_arrey [1]}"
					# puts "NEW DATE: #{one_news_arrey [2][0]}/#{one_news_arrey [2][1]}/#{one_news_arrey [2][2]}"
					# puts "NEW URL: #{one_news_arrey [3]}"
					# puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
				end

			when 4

				system ('clear')
				reddit_inarrey_length = news.jsons_item (0)
				mashable_inarrey_length = news.jsons_item (1)
				digg_inarrey_length = news.jsons_item (2)
				all_news = []

				for i in 0..reddit_inarrey_length - 1 do
					all_news.push (news.reddit_params (i))
				end

				for i in 0..mashable_inarrey_length - 1 do
					all_news.push (news.mashable_params (i))
				end

				for i in 0..digg_inarrey_length - 1 do
					all_news.push (news.digg_params (i))
				end

				#puts all_news [1][2][0]
				all_news.sort_by!{|i| i[2][0]}
				
				all_news.each do |item|
					case item[4]
					when 1
						puts "REDDIT NEWS"
					when 2
						puts "MASHABLE NEWS"
					when 3
						puts "DIGG NEWS"
					end

					Printit.print_news (item)
					# puts "NEW TITLE: #{item [0]}"
					# puts "NEW AUTHOR: #{item [1]}"
					# puts "NEW DATE: #{item [2][0]}/#{item [2][1]}/#{item [2][2]}"
					# puts "NEW URL: #{item [3]}"
					# puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

				end

			#else
				#exit!
				
			end
		end

	end
end

Main.new