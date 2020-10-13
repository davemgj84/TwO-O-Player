# Game
#   new game -
#   provide player and question info
#   Turn? (game loop?)
#   can call lives_reducer method
#   use gameIO to get/return IO
#   input_output
#   user input answer
#   game output correct/incorrect?
#   question output, score output, winner output?

require "./player"
require "./question"

class Game

  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
    @current_player = @p1
  end

  def start
    round
    gameover
  end

  private
  
  def swap_player 
    if @current_player == @p1
      @current_player = @p2
    else
      @current_player = @p1
    end
  end

  def start_turn
    @question = Question.new
    @question.ask(@current_player.name)
  end

  def round
    while @p1.alive? && @p2.alive?
      puts "~~~~~~~~ NEW TURN ~~~~~~~~"
      start_turn
      response = gets.chomp.to_i
      if @question.check_response(response)
        puts "\n#{@current_player.name}: YES! You are correct!!!"
      else
        puts "\n#{@current_player.name}: NO! Sorry, but that is incorrect!!!"
        @current_player.lose_life
      end
      puts "\nP1: #{@p1.format_lives} vs P2: #{@p2.format_lives}"
      swap_player
    end
  end

  def gameover
    puts "\n#{@current_player.name} wins with a score of #{@current_player.format_lives}!"
    puts "\n~~~~~~~~ GAME OVER ~~~~~~~~"
    puts "\nThanks for playing! Goodbye!"
  end

end
