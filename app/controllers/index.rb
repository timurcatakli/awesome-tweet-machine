get '/' do
  if session[:user_id]
  	redirect '/users/index'
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
<<<<<<< HEAD
  user = User.authenticate(params[:username], params[:password])

  if  user == false
  	redirect "/?error=invalidpassword"
  else
  	session[:user_id] = user.id
  	redirect '/'
  end

end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end