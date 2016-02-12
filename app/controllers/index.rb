get '/' do
  if session[:user_id]
  	redirect "users/#{session[:user_id]}/following/tweets"
  end

  @error = params[:error]
  erb :index

end


# test route
get '/bootstrap' do
  erb :'bootstrap'
end

post '/' do

  error = ""
  user = User.authenticate(params[:username], params[:password])

  if  user == false
  	redirect "/?error=invalidpassword"
  else
  	session[:user_id] = @user.id
    p "*" * 80
    p session.inspect
  	redirect "/users/#{@user.id}/following/tweets"
  end

end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end