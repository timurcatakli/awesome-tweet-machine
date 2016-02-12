post '/users/:user_id/tweets/' do

  
  @user = User.find(params[:user_id])
  @tweet = Tweet.create(post: params[:post], user_id: @user.id)

  if @tweet.save
    redirect "/users/#{@user.id}/tweets"
  else
    erb :'index'
  end

end


get '/users/:user_id/tweets/new' do 
  @user = User.find(@@USER_ID)
  erb :'tweets/new'
end


get '/users/:user_id/tweets' do 

  @user = User.find(params[:user_id])
  @tweets = @user.tweets
  @retweets = @user.retweets
  erb :'tweets/index'

end

get '/users/:user_id/retweets/:tweet_id/new' do

  @retweet = Retweet.create(tweet_id: params[:tweet_id], user_id: @@USER_ID)
  @user = User.find(@@USER_ID)
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