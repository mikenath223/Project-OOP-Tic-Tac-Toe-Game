#!/usr/bin/env ruby
puts "Hello welcome to the tic-tactoe game!"
print "First player's name: "
first_player_name = gets.chomp

print "Second player's name: "
second_player_name = gets.chomp

puts " "

print "#{first_player_name}, Kindly chose between 'X' or '0':"
first_player_choice = gets.chomp

puts "You have picked #{first_player_choice}"

puts "Exellent! Now it's your opponent's turn"

puts " "

print "#{second_player_name}, Kindly chose between 'X' or '0':"
second_player_choice = gets.chomp

puts "You have picked #{second_player_choice}"

puts " "

puts "These are both your moves on the board: "

puts "Congratulations! #{first_player_choice}, You WIN!"


puts "Congratulations! #{second_player_choice}, You WIN!"

puts "It's a draw!"
