get '/users/new' do
  p "*" * 50
  @error = params[:error_message]
  erb :'users/new'
end

post '/users' do
  p params
  params.to_s
  @new_user = User.create(name: params[:name], email: params[:email], username: params[:username], password_hash: params[:password])
  p @new_user
  p @new_user.errors.count
  p @new_user.errors
  @error_message = ""
  if @new_user.errors.messages[:email]
    if @new_user.errors.messages[:email].include? "has already been taken"
      # duplicate email
      @error_message = "dupe_email"
    end
  end

  if @new_user.errors.messages[:username]
    if @new_user.errors.messages[:username].include? "has already been taken"
      # duplicate username
      @error_message = "dupe_user"
    end
  end

  if @error_message != ""
    redirect "/users/new?error_message=#{@error_message}"
  end

  "SUCCESSFUL REGISTRATION"

end

get '/users/index' do
  @logged_in_user = User.find(2) #delete once session is ready
  # @logged_in_user = User.find(session[:user_id])
  # redirect :'/users/:user_id/followeds/tweets'
  redirect '/users/1/followeds/tweets' #fix this to contain logged in user's id
end

get '/users/:id' do #User has a profile page
  @logged_in_user = User.find(2) #delete once session is ready
  # @logged_in_user = User.find(session[:user_id])
  @user = User.find(params[:id])
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

