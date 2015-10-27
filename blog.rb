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
	def publish_front_page
		@container.each do |post|
			puts "#{post.title}\n************\n#{post.text}\n------------"
		end
	end
end


blog = Blog.new
blog.add_post Post.new("Post title 1","27/10/15","Post 1 text")
blog.add_post Post.new("Post title 2","26/10/15","Post 2 text")
blog.add_post Post.new("post title 3","23/10/15","Post 3 text")
blog.publish_front_page