get '/signup' do
  erb :signup
end

get '/login' do
  erb :login
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/users' do
  @users = User.all
  erb :users
end

get '/user/:id' do
  @user = User.find_by_id(params[:id])
  erb :user_profile
end

get '/users/:user_id/albums' do
  erb :albums
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/user/' + user.id.to_s
  else
    redirect '/'
  end
end

post '/login' do
  user = User.authenticate(params[:user])
  if user
    session[:user_id] = user.id
    redirect '/user/' + user.id.to_s
  else
    redirect '/'
  end
end

