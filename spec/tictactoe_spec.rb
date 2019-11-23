# frozen_string_literal: true

require './lib/logic.rb'

RSpec.describe TicTacToe::Player do
  let(:player) { TicTacToe::Player.new('Michgolden', 'Christian') }

  describe '#player1' do
    context 'Shows correct player 1 name' do
      it do
        expect(player.player1).to eq('Michgolden')
      end
    end
  end

  describe '#player2' do
    context 'Shows correct player 2 name' do
      it do
        expect(player.player2).to eq('Christian')
      end
    end
  end

  describe '#switch_players' do
    context 'Switches to player 1 when it\'s their turn' do
      it do
        expect(player.switch_players(1).odd?).to eq(@player1)
      end
    end
  end

  describe '#switch_players' do
    context 'Switches to player 2 when it\'s their turn' do
      it do
        expect(player.switch_players(2).even?).to eq(@player2)
      end
    end
  end

end

# RSpec.describe TicTacToe::Game do
#   let(:board) { TicTacToe::Game.new }
#   describe 'switch_pick' do
#     context 'Outputs ''X'' to the board as player 1''s move' do
#       it do
#         expect(game.switch_pick(1).odd?).to eq('X')
#       end
#     end
#   end

#   describe 'switch_pick' do
#     context 'Outputs ''O'' to the board, as player 2''s move' do
#       it do
#         expect(game.switch_pick(2).even?).to eq('O')
#       end
#     end
#   end

#   describe 'check_input' do
#     context 'Returns false if the input is zero' do
#       it do
#         expect(game.check_input(0)).to eq(false)
#       end
#     end
#   end

#   describe 'check_input' do
#     context 'Returns true if the input is numeric number(1..9)' do
#       it do
#         expect(game.check_input().is_a?(Numeric)).to eq(true)
#       end
#     end
#   end

#   describe 'check_input' do
#     context 'Returns true if the input is number between 1 to 9' do
#       it do
#         expect(game.check_input(1..9)).to eq(true)
#       end
#     end
#   end

#   describe 'check_input' do
#     context 'Returns true if the input is not empty' do
#       it do
#         expect(game.check_input.().empty?).to eq(true)
#       end
#     end
#   end

#   describe 'game_over?' do
#     context 'Returns true if there is a winner on the board' do
#       it do
#         expect(game.game_over?.winner?).to eq(true)
#       end
#     end
#   end

#   describe 'check_input' do
#     context 'Returns false if there is no winner on the board ' do
#       it do
#         expect(game.game_over?.!winner?).to eq(false)
#       end
#     end
#   end

#   describe 'print_grid' do
#     context 'Maps out the grid for the user' do
#       it do
#         expect(game.print_grid.map?).to eq(print_board)
#       end
#     end
#   end

#   describe 'grid_default' do
#     context 'Maps out a new grid for the user' do
#       it do
#         expect(game.grid_default).to eq(board)
#       end
#     end
#   end
# end
