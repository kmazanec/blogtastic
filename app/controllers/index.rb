get '/' do
  @tags = Tag.all
  @posts = Post.all
  # Look in app/views/index.erb
  erb :index
end
