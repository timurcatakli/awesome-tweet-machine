put '/users/:user_id/followers/:id' do
  @user = User.find(params[:user_id])
  @following = User.find(params[:id])

  @user.following << following
  @user.save

  redirect "/users/#{@user.id}/followers"
end


delete '/users/:user_id/following/:id' do
  @user = User.find(params[:user_id])
  # @follower_to_be_removed = User.find(params[:id])
  @connection = Connection.find_by(follower_id: params[:user_id], followed_id: params[:id])
  Connection.destroy(@connection.id)

 redirect "/users/#{params[:user_id]}/following"
end

get '/users/:user_id/following/new' do
  p params
  @user = User.find(params[:user_id])

  erb :'/followers/follow_new'
end

put '/users/:user_id/following/new' do
  p params
  @user = User.find(params[:user_id])
  @following = User.find_by(username: params[:following])

  if @following == nil
    @unknown_user = true
    erb :'/followers/follow_new'
  else
    @user.following << @following
    redirect "/users/#{params[:user_id]}/following"
  end

end

get '/users/:id/following' do
  @user = User.find(params[:id])

  erb :'/followers/following'
end

get '/users/:user_id/followers' do
  @user = User.find(params[:user_id])

  erb :'/followers/followers'
end
