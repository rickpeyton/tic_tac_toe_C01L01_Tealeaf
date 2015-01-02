# Tic Tac Toe Game
# Tealeaf Academy C01L01
require 'pry'

VICTORY_CONDITIONS =
  { a: '123',
    b: '456',
    c: '789',
    d: '147',
    e: '258',
    f: '369',
    g: '159',
    h: '357' }

possible_moves =
  { '1' => ' ', '2' => ' ', '3' => ' ', '4' => ' ', '5' => ' ',
    '6' => ' ', '7' => ' ', '8' => ' ', '9' => ' ' }

def validate_pick_position?(possible_moves, pick)
  if possible_moves[pick] == ' '
    true
  else
    false
  end
end

def victory_check(picks, possible_wins)
  possible_wins.values.each do |v|
    three_to_win = 0
    picks.each_char do |c|
      if v.includes?(c)
        three_to_win += 1
      end
      if three_to_win == 3
        return true
      end
    end
  end
  return false
end

def draw_game_board(moves)
puts <<EOF

      |   |   
    #{moves['1']} | #{moves['2']} | #{moves['3']} 
      |   |   
   ---+---+---
      |   |   
    #{moves['4']} | #{moves['5']} | #{moves['6']} 
      |   |   
   ---+---+---
      |   |   
    #{moves['7']} | #{moves['8']} | #{moves['9']} 
      |   |   

EOF
end

all_player_picks = []

puts '###########################'
puts '# Welcome to Tic Tac Toe! #'
puts '###########################'
puts ''

begin
  draw_game_board(possible_moves)

  begin
    puts 'Pick a play on the game board (1 - 9)'
    player_pick = gets.chomp.downcase
    validate_pick = validate_pick_position?(possible_moves, player_pick)
  end while validate_pick == false

  possible_moves[player_pick] = 'X'
  all_player_picks << player_pick
  draw_game_board(possible_moves)

  if victory_check(all_player_picks, VICTORY_CONDITIONS)
    puts 'You win!'
    break
  end

  # Computer Turn
  # if a victory condition exists move there
  # else if a player victory exists move there
  # else pick random

  # Repeat until there is a victor

  # Increment score for victor

  puts "Would you like to play again? (y/n)"
  keep_playing = gets.chomp.downcase
end while keep_playing == 'y'
