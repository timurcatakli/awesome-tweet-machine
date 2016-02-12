# create a new user
get '/users/new' do
  @error = params[:error_message]
  erb :'users/new'
end

# create a new user
post '/users' do
  @new_user = User.new(name: params[:name], email: params[:email], username: params[:username])
  @new_user.password = params[:password]
  @new_user.save
  error_message = ""
  if @new_user.errors.messages[:email]
    if @new_user.errors.messages[:email].include? "has already been taken"
      error_message = "dupe_email"
    end
  end

  if @new_user.errors.messages[:username]
    if @new_user.errors.messages[:username].include? "has already been taken"
      error_message = "dupe_user"
    end
  end

  p '=' * 50
  p params
  p '=' * 50


  p '=' * 50
  p error_message
  p '=' * 50

  if error_message != ""
    redirect "/users/new?error_message=#{error_message}"
  end

  session[:user_id] = @new_user.id
  redirect '/'
end

# catch who is logged in and send to page that displays folks they're following
get '/users/index' do
  @logged_in_user = User.find(session[:user_id])
  redirect "/users/#{@logged_in_user.id}/following/tweets" #fix this to contain logged in user's id
end

get '/users/:id' do #User has a profile page
  p "*******" * 10
  p session.inspect

  @logged_in_user = User.find(session[:user_id])
  p "*******" * 10
  p @logged_in_user
  @user = User.find(params[:id])
  p "*******" * 10
  p @user
  erb :'users/profile'
end

get '/users/:user_id/following/tweets' do
  @user = User.find(params[:user_id])
  @following = @user.following
  @recent_tweets = []

  @following.each do |user|
    @recent_tweets << user.tweets
  end
  @recent_tweets.flatten!

  @recent_tweets = @recent_tweets.sort! {|x, y| y.created_at <=> x.created_at} if @recent_tweets.length > 1

  erb :'users/index'
end

