require 'date'

class Post
	attr_accessor :title, :date, :text, :sponsor
	def initialize(title, date, text, sponsor)
		@title = title
		@date = date
		@text = text
		@sponsor = sponsor
	end
end

class Blog
	def initialize
		@container = []
		@page 
	end
	def add_post(post)
		@container << post
	end
	def create_front_page
		@container.sort!{|post1, post2| post2.date <=> post1.date}
	end
	def add_sponsor(post)
		if post.sponsor == true
			post.title = "*****" + post.title + "*****"
		end
	end
	def navigator(page)
		puts "1\t2\t3"
		direction = gets.chomp.downcase
		if direction == "next"
			page = page + 3
		elsif direction == "prev"
			page = page - 3
		else
			exit
		end	
		if page < 1
			puts "Has llegado al limite inicial"
			page = 1
			elsif page > 7
				puts "has llegado al limite final"
				page = page - 3
			end					
		publish_front_page(page)
	end
	def publish_front_page(page)
		@container.each_with_index do |post, index|
					add_sponsor(post)
			if index <= page+1 && index >= page-1
				puts "#{post.title}\n************\n#{post.text}\n------------"
			end
		end
		navigator(page)
	end
end

blog = Blog.new
blog.add_post Post.new("Post title 1",Date.new(2015,10,2),"Post 1 text",false)
blog.add_post Post.new("Post title 2",Date.new(2015,10,4),"Post 2 text",true)
blog.add_post Post.new("post title 3",Date.new(2015,10,1),"Post 3 text",false)
blog.add_post Post.new("post title 4",Date.new(2015,10,5),"Post 4 text",false)
blog.add_post Post.new("post title 5",Date.new(2015,10,9),"Post 5 text",false)
blog.add_post Post.new("post title 6",Date.new(2015,10,12),"Post 6 text",false)
blog.add_post Post.new("post title 7",Date.new(2015,10,11),"Post 7 text",false)
blog.add_post Post.new("post title 8",Date.new(2015,10,7),"Post 8 text",false)
blog.add_post Post.new("post title 9",Date.new(2015,10,8),"Post 9 text",false)


blog.create_front_page
blog.publish_front_page(1)