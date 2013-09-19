get '/tags' do
  redirect to('/')
end

get '/tags/:id' do
  @tags = Tag.all
  @tag = Tag.find(params[:id])
  @posts = @tag.posts
  erb :index
end