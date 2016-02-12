get '/' do
  redirect '/users/index'
end


# test route
get '/bootstrap' do
  erb :'bootstrap'
end