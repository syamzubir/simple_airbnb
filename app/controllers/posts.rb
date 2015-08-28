get '/new_post' do
  erb :new_post
end

get '/view_post' do
  # @post = Post.find(params[:id])
  erb :view_post
end

get '/edit_post' do
  # @post = Post.find(params[:id])
  erb :edit_post
end

get '/delete_post' do
  @post = Post.find(params[:id])
  Post.destroy(@post)
  erb :delete_post
end

post '/new_post' do
  @title = params[:title]
  @content = params[:content]
  @author = params[:author]
  @tags = params[:tags].split(", ")
  @new_post = Post.new(title: @title, content: @content, author: @author)
  @tags.each do |tag|
  @tag = Tag.find_or_create_by(name: tag)
  @tag.posts << @new_post
end

@new_post.save
  if @new_post.save
    erb :index
  else
    @error = "Fields cannot be empty!"
  erb :new_post
  end


# end

# post '/edit_post' do
#   @post = Post.find(params[:id])
#   @post.title = params[:title]
#   @post.content = params[:content]
#   @post.author = params[:author]
#   @tags = params[:tags].split(", ")
#   @tags.each do |tag|

#   if Tag.find_by(name: tag) == nil
#     @tag = Tag.find_or_create_by(name: tag)
#     @tag.posts << @post
#   end
# end

# @post.save
#   if @post.save
#     erb :index
#   else
#     @error = "Fields cannot be empty!"
#     erb :edit_post
#   end
end