require 'bundler'
require_relative('models/quiz.rb')
Bundler.require


class MyApp < Sinatra::Base
  
  $quizes = ['usa', 'adam_quiz', 'jack is a muff quiz']
  
  get '/' do
    erb :index
  end
  
  post '/quiz_list' do
=begin
    if params.has_key?("quiz_name")
      new_quiz = Quiz.new(params[:quiz_name], params[:quiz_description], params[:quiz_answers])
      $quizes << new_quiz
    end
=end
    erb :quiz_list
  end
  
  post '/create_quiz' do
    erb :create_quiz
  end
  
  post '/quiz' do
    erb :quiz
  end
  
end