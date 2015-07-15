class Quiz
  def initialize(name, description, type = list)  
    @name = name
    @answers = []
    @completed = []
    @description = description
    @type = type
    @finished = false
  end
  attr_accessor :name, :answers, :description, :type, :finished, :completed
  
  def add_answer(answer)
    @answers << answer
  end
  
  def is_complete
    if @completed == @answers
      @finished = true
      return "YOU WIN!!!"
    end
  end
  
  def check_answer(guess)
    if @answers.include?(guess)
      @completed << guess
    end
  end
  
end

usa = Quiz.new('USA STATES', 'list all of the states')
usa.add_answer('new york')

