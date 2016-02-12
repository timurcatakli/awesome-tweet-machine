post '/users/:user_id/tweets/' do

  
  # @user = User.find(params[:user_id])
  # @tweet = @user.tweets.new(params[:tweet])

  # if @tweet.save
  #   redirect "/users/#{@user.id}/tweets"
  # else
  # erb :'tweets/new'
  # end


end


get '/users/:user_id/tweets/new' do 
  @user = User.find(params[:user_id])
  erb :'tweets/new'
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