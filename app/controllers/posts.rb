
get '/create' do
  erb :create
end

get '/posts/:id/update' do
  @post = Post.find(params[:id])
  erb :update
end

get '/posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy
  # delete post here
  redirect to('/')
end

get '/posts/:id' do
  @tags = Tag.all
  @posts = Post.find(params[:id])
  erb :index
end

#==POST=============================================


post '/update/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  params[:tags]
  format_tags(params[:tags]).each do |tag|
    begin
      new_post.tags << Tag.find_or_create_by_name(tag)
    rescue Exception => e
      puts e.message
    end
  end

end

post '/create' do
  new_post = Post.create(params[:post])
  if new_post.valid?
    # add in all the tags
    format_tags(params[:tags]).each do |tag|
      begin
        new_post.tags << Tag.find_or_create_by_name(tag)
      rescue Exception => e
        puts e.message
      end
    end
    redirect to('/')
  else
    # the post didn't work for some reason
  end

end