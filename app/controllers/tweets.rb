post '/users/:user_id/tweets/' do


  @user = User.find(session[:user_id])
  @tweet = Tweet.create(post: params[:post], user_id: @user.id)

  if @tweet.save
    redirect "/users/#{@user.id}/tweets"
  else
    erb :'index'
  end

end


get '/users/:user_id/tweets/new' do
  @user = User.find(session[:user_id])
  erb :'tweets/new'
end


get '/users/:user_id/tweets' do

  @user = User.find(15)

  @recent_tweets = []
  @recent_tweets << @user.tweets
  @recent_tweets << @user.retweets
  # @tweets = @user.tweets
  # @retweets = @user.retweets

  @recent_tweets.flatten!

  @recent_tweets = @recent_tweets.sort! {|x, y| y.created_at <=> x.created_at} if @recent_tweets.length > 1
  erb :'tweets/index'

end

put '/users/:user_id/retweets/:tweet_id/new' do

  @retweet = Retweet.create(tweet_id: params[:tweet_id], user_id: session[:user_id])
  @user = User.find(session[:user_id])
  @tweets = @user.tweets
  erb :'tweets/index'
end

# post '/categories/:id/articles/new' do
#     @new_article = Article.create(
#       title: params[:title],
#       category_id: params[:category_id],
#       price: params[:price],
#       email: params[:email],
#       description: params[:description])
#       @article = @new_article
#     @secret_key = rand(1000...9999).to_s
#     erb :'articles/article_show'
#     # redirect "/categories/#{params[:category_id]}/articles/new"
# end
