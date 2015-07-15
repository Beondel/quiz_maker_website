require 'bundler'
Bundler.require



class MyApp < Sinatra::Base
  
  get '/' do
    erb :index
  end
  
  post '/quiz_list' do
    erb :quiz_list
  end
  
  post '/create_quiz' do
    erb :create_quiz
  end
  
  post '/quiz' do
    erb :quiz
  end
  
end