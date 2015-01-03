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

def validate_pick_position?(possible_moves, pick)
  if possible_moves[pick] == ' '
    true
  else
    false
  end
end

def check_for_victory(pick, all_picks, victory_conditions)
  victory_conditions.values.each do |v|
    if v.include?(pick)
      victory_counter = 0
      all_picks.each { |p| victory_counter += 1 if v.include? p }
      return true if victory_counter == 3
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

player_score = 0
computer_score = 0

puts '###########################'
puts '# Welcome to Tic Tac Toe! #'
puts '###########################'
puts ''

begin
  all_player_picks = []
  all_comp_picks = []
  possible_moves =
    { '1' => ' ', '2' => ' ', '3' => ' ', '4' => ' ', '5' => ' ',
      '6' => ' ', '7' => ' ', '8' => ' ', '9' => ' ' }
  total_moves = 0
  draw_game_board(possible_moves)
  game_over = false
  begin

    begin
      puts 'Pick a play on the game board (1 - 9)'
      player_pick = gets.chomp.downcase
      validate_pick = validate_pick_position?(possible_moves, player_pick)
    end while validate_pick == false
    total_moves += 1

    possible_moves[player_pick] = 'X'
    all_player_picks << player_pick
    draw_game_board(possible_moves)

    if check_for_victory(player_pick, all_player_picks, VICTORY_CONDITIONS)
      puts 'You Win!'
      player_score += 1
      puts "Wins: #{player_score}. Computer Wins: #{computer_score}"
      game_over = true
    end

    unless game_over || total_moves == 9
      begin
        computer_pick = rand(1..9).to_s
        validate_pick = validate_pick_position?(possible_moves, computer_pick)
      end while validate_pick == false
      total_moves += 1

      possible_moves[computer_pick] = 'O'
      all_comp_picks << computer_pick
      puts 'Computer makes its move...'
      draw_game_board(possible_moves)

      if check_for_victory(computer_pick, all_comp_picks, VICTORY_CONDITIONS)
        puts 'Computer Wins!'
        computer_score += 1
        puts "Wins: #{player_score}. Computer Wins: #{computer_score}"
        game_over = true
      end
    end

    if total_moves == 9 && game_over == false
      puts 'It\'s a draw!'
      game_over = true
      puts "Wins: #{player_score}. Computer Wins: #{computer_score}"
    end

  end while game_over == false

  puts 'Would you like to play again? (y/n)'
  keep_playing = gets.chomp.downcase

end while keep_playing == 'y'
