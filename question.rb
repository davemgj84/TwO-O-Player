# Question
#   attr_reader: question
#   attr_reader :answer
#   method to generate 2 numbers between 1-20
#   interpolate into a math problem?

class Question
  attr_reader :question
  attr_reader :answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end
  
  def ask(curent_player)
    puts "#{curent_player}: What does #{@num1} plus #{@num2} equal?"
  end

end
