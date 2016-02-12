post '/users/:user_id/followers/:id'
  user = User.find(params[:user_id])
  following = User.find(params[:id])

  user.following << following
  user.save

  redirect '/users/user_id/followers'
end

get '/users/:user_id/following'
  @user = User.find(params[:user_id])

  erb :'views/following'
end

get '/user/:user_id/followers'
  @user = User.find(params[:user_id])

  erb :'views/followers'
end
