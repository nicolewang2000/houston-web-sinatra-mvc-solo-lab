class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
        set :method_override, true
      end
    
      get '/' do
        erb :welcome
      end

      get '/index' do
        @puppies = Puppy.all
        erb :index
      end 

      get '/index/new' do 
        erb :new
      end

      get '/index/:id' do
        @puppy = Puppy.find(params[:id])
        erb :show
      end

      post '/index' do
        puppy = Puppy.create(params)
        redirect "/index/#{puppy.id}"
      end

      get '/index/:id/edit' do
        @puppy = Puppy.find(params[:id])
        erb :edit
      end

      patch '/index/:id' do
        puppy = Puppy.find(params[:id])
        puppy.update(name: params[:name], breed:params[:breed])
      redirect "/index/#{puppy.id}"
      end
   
      delete '/index/:id' do 
        puppy = Puppy.find(params[:id])
        puppy.destroy
        redirect "/index"
      end

end
