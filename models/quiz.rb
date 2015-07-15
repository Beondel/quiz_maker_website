class Quiz
  def initialize(name, description, answers, type = list)  
    @name = name
    @answers = answers
    @answers_list = []
    @completed = []
    @description = description
    @type = type
    @finished = false
  end
  attr_accessor :name, :answers, :description, :type, :finished, :completed, :answers_list
 
#  def add_answer(answer)
#    @answers << answer
#  end
  
  def creat_answers_list
    @answers_list = @answer.upcase.split(", ")
  end
  
  def is_complete
    if @completed == @answers_list
      @finished = true
      return "YOU WIN!!!"
    end
  end
  
  def check_answer(guess)
    if @answers_list.include?(guess.upcase)
      @completed << guess.upcase
    end
  end
end

usa = Quiz.new('USA STATES', 'list all of the states', 'new york, new jersey, massachusetts, beau heffron')

