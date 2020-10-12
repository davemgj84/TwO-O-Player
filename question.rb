# Question
#   attr_reader: question
#   method to generate 2 numbers between 1-20
#   interpolate into a math problem?

class Question
  attr_reader :question
  attr_reader :answer

  def initialize
    num1 = rand(1..20)
    num2 = rand(1..20)
    @question = "What does #{num1} plus #{num2} equal?"
    @answer = num1 + num2
  end

end
