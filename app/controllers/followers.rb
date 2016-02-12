put '/users/:user_id/followers/:id' do
  @user = User.find(params[:user_id])
  @following = User.find(params[:id])

  @user.following << following
  @user.save

  redirect "/users/#{@user.id}/followers"

delete '/users/:user_id/following/:id' do
  @user = User.find(params[:user_id])
  @following = User.find(params[:id])
  #check this in the morning
  @user.following.delete_at(following)

end

get '/users/:user_id/following' do
  @user = User.find(params[:user_id])

  erb :'views/followers/following'
end

get '/user/:user_id/followers' do
  @user = User.find(params[:user_id])

  erb :'views/followers/followers'
end
