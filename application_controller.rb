require 'bundler'
require_relative('models/quiz.rb')
Bundler.require


class MyApp < Sinatra::Base
  
  quiz1 = Quiz.new("USA", "Name the states", "New York, New Jersey, Massachusetts")
  quiz2 = Quiz.new("World", "Name all countries", "USA, Canada, UK")
  $quizzes = [quiz1, quiz2]
  
  get '/' do
    erb :index
  end
  
  post '/quiz_list' do
=begin
    if params.has_key?("quiz_name")
      new_quiz = Quiz.new(params[:quiz_name], params[:quiz_description], params[:quiz_answers])
      $quizzes << new_quiz
    end
=end
    erb :quiz_list
  end
  
  post '/create_quiz' do
    erb :create_quiz
  end
  
  post '/quiz' do
    puts params
    erb :quiz
  end
  
end