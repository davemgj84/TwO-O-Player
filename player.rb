# Player
#   attr_reader :name
#   attr_reader :lives
#   method that reduces lives
#   Name ("Player 1")
#   lives ("3/3")

class Player
  attr_reader :name
  attr_reader :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def death
    @lives = @lives - 1
  end

  def format_lives
    "#{lives}/3"
  end

end