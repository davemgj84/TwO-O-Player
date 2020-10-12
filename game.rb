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
  
  def turn 
    if @current_player == @p1
      @current_player = @p2
    elsif @current_player == @p2
      @current_player = @p1
    end
  end

  def start
    @q1 = Question.new
    @q1.ask(@current_player.name)
    puts
    response = gets.chomp.to_i
    if @q1.answer == response
      puts
      puts "#{@current_player.name}: YES! You are correct!!!"
    else
      puts
      puts "#{@current_player.name}: NO! Sorry, but that is incorrect!!!"
      @current_player.lose_life
    end
      puts
      puts "P1: #{@p1.format_lives} vs P2: #{@p2.format_lives}"
      puts
    if @current_player.death?
      turn
      puts
      puts "#{@current_player.name} wins with a score of #{@current_player.format_lives}!"
      puts
      puts "-------- GAME OVER --------"
      puts
      puts "Thanks for playing! Goodbye!"
      puts
    else 
      turn
      start
    end 
  end

end
