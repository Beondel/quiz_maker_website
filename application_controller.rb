require 'bundler'
require_relative('models/quiz.rb')
Bundler.require


class MyApp < Sinatra::Base
  
  quiz1 = Quiz.new("USA", "Name the states", "New York, New Jersey, Massachusetts, Pennsylvania")
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
    quiz_name = params[:quiz_selection]
    for i in 0...$quizzes.length
      if $quizzes[i].name == quiz_name
        quiz_taken = $quizzes[i]
      end
    end
    @quiz_name = quiz_taken.name
    @quiz_description = quiz_taken.description
    @answers = quiz_taken.answers_list
    erb :quiz
  end
  
  post '/results' do
    answers = params.values
    answers.delete_at(answers.length - 1)
    key = answers.delete_at(answers.length - 1).split(",")
    @score = 0
    @num_questions = key.length
    for i in 0...answers.length
      if key.include?(answers[i].upcase)
        @score += 1
      end
    end
    erb :results
  end
  
end