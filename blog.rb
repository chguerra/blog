class Post
	attr_reader :title, :date, :text
	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text
	end
end

class Blog
	def initialize
		@container = []
	end
	def add_post(post)
		@container << post
	end
	def sort_by_date
		@container.sort!{|post1, post2| post2.date <=> post1.date}
	end
	def publish_front_page
		@container.each do |post|
			puts "#{post.title}\n************\n#{post.text}\n------------"
		end
	end
end


blog = Blog.new
blog.add_post Post.new("Post title 1",'2015-10-10',"Post 1 text")
blog.add_post Post.new("Post title 2",'2015-10-11',"Post 2 text")
blog.add_post Post.new("post title 3",'2015-10-12',"Post 3 text")
blog.sort_by_date
blog.publish_front_page