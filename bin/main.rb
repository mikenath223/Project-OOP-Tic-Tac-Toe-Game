#!/usr/bin/env ruby
require "./lib/logic.rb"

def welcome
puts "Welcome to the TicTacToe Game"
end

def rules
puts "The rules..."
puts "The board is arranged in squares boxes which start from number 1 to 9. 
When you choose to play either X or O you also have to choose on which position 
of the board you will place your choice. May the odds be ever in your favor :)"
puts ""
puts "Sample board containing numbered positions. "
puts "| 1 || 2 || 3 |"
puts "----+----+-----+"
puts "| 4 || 5 || 6 |"
puts "----+----+-----+"
puts "| 7 || 8 || 9 |"

puts " "
end

def get_player_names
  puts 'Player 1 kindly enter your name: '
  player1 = gets.chomp.capitalize!
  puts 'Player 2 kindly enter your name: '
  player2 = gets.chomp.capitalize!
  puts "Good to have you here #{player1} and #{player2}"
  players = [player1, player2]
  chosen_players = players.shuffle
  puts "#{chosen_players[0]} has randomly been selected as first player"
  chosen_players
end


def check_input(input)
  return true if input.is_a?(Numeric) && input.length == 1
  false
end

def ask_move(current_player_name)
  "#{current_player_name}: Enter a number between 1 and 9 to make your move"
end

def get_move(human_move = gets.chomp)
  right_input = check_input(human_move)
  human_move_to_cord(right_input)
end

def game_over_message
  return "#{current_player.name} won!" if board.game_over? == :winner
  return 'The game ended in a draw' if board.game_over? == :draw
end


def play(game)
    loop do
      board.format_grid
      puts ''
      puts ask_move
      cord_x, cord_y = get_move
      board.set_cell(cord_x, cord_y, current_player.pick)
      if board.game_over?
        puts game_over_message
        board.format_grid
        return
      else
        switch_players
      end
    end
end

welcome

names = get_player_names

game = TicTacToe::Game.new(names[0], names[1])

play(game)