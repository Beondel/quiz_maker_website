class Quiz
  def initialize(name, description, answers, type = "list")
    @name = name
    @answers = answers.to_s
    @answers_list = []
    create_answers_list
    @completed = []
    @description = description
    @type = type
    @finished = false
  end
  attr_accessor :name, :answers, :description, :type, :finished, :completed, :answers_list
  
  def create_answers_list
    @answers_list = @answers.upcase.split(", ")
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