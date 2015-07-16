require 'bundler'
require_relative('models/quiz.rb')
Bundler.require


class MyApp < Sinatra::Base
  
  $quizes = ['usa', 'adam_quiz']
  
  get '/' do
    erb :index
  end
  
  post '/quiz_list' do
    if params != {}
      new_quiz = Quiz.new(params[:quiz_name], params[:quiz_description], params[:quiz_answers])
      $quizes << new_quiz
    end
    erb :quiz_list
  end
  
  post '/create_quiz' do
    erb :create_quiz
  end
  
  post '/quiz' do
    erb :quiz
  end
  
end