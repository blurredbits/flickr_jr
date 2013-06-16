get '/' do
  if Photo.any?
    @photos = Photo.all
  else
    @photos = 0
  end
  erb :index
end

post '/upload' do
  upload = Photo.new(params[:photo])
  upload.save
  redirect to ('/')
end

