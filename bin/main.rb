#!/usr/bin/env ruby
puts "Hello welcome to the tic-tactoe game!"
puts " "

puts "The rules..."
puts "The board is arranged in squares boxes which start from number 1 to 9. 
When you choose to play either X or O you also have to choose on which position 
of the board you will place your choice. May the odds be ever in your favor :)"
puts " "

puts "Here is the board below where both your choices will be displayed on the board. "
puts " "

print "Input First player's name: "
first_player_name = gets.chomp

print "Input Second player's name: "
second_player_name = gets.chomp

puts " "

game_on = true

#initial instructions for player

while game_on
    #loop for each move
    if winner_and_or_draw
        game_on = false
        #breaks loop
    end

#each move
print "#{first_player_name}, Kindly chose between 'X' or '0': "
    first_player_choice = gets.chomp
# Check to confirm if right input, if not request for right input


    puts "You have picked #{first_player_choice}"
    print "#{first_player_name}, Kindly chose from position 1 to 9 on which position of 
    the board you wish to place your choice? "
    first_player_board_position = gets.chomp
# Check to confirm if right input, if not request for right input

    puts "Nice #{first_player_name} has chosen to play #{first_player_choice} at 
    position #{first_player_board_position}. Now your choice is displayed on the board below. "

#Now board is displayed
puts "Here is the result of the board "


    puts "Exellent! Now it's your opponent's turn"

    puts " "

    print "#{second_player_name}, Kindly chose between 'X' or '0': "
    second_player_choice = gets.chomp
# Check to confirm if right input, if not request for right input

    puts "You have picked #{second_player_choice}"
    print "#{second_player_name}, Kindly chose between 1 to 9 on which position of 
    the board you wish to place your choice? "
    second_player_board_position = gets.chomp
# Check to confirm if right input, if not request for right input

    puts "Nice #{second_player_name} has chosen to play #{second_player_choice} at 
    position #{second_player_board_position}." 

#Now board is displayed

    puts "Here is the result of the board "

end



if game_on == false
#Now board is displayed

puts "Here is the result of the final board "


  if x_wins
    puts " "
    puts "Congratulations! #{first_player_name}, You WIN!"
    puts "Oh no! #{first_player_name}, You Lose :("
    puts " "
  elsif o_wins
    puts "Congratulations! #{second_player_name}, You WIN!"
    puts "Oh no! #{second_player_name}, You Lose :("
    puts " "
  else
    puts "It's a tie!"
  end
end