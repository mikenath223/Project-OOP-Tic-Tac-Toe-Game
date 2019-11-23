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
        expect(player.switch_players(1)).to eq("Michgolden")
      end
    end
  end

  describe '#switch_players' do
    context 'Switches to player 2 when it\'s their turn' do
      it do
        expect(player.switch_players(2)).to eq("Christian")
      end
    end
  end
end

RSpec.describe TicTacToe::Game do
  let(:game) { TicTacToe::Game.new }
  let(:board) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
  
  describe 'switch_pick' do
    context 'Outputs ''X'' to the board as player 1''s move' do
      it do
        expect(game.switch_pick(1)).to eq('X')
      end
    end
  end

  describe 'switch_pick' do
    context 'Outputs ''O'' to the board, as player 2''s move' do
      it do
        expect(game.switch_pick(2)).to eq('O')
      end
    end
  end

  describe 'check_input' do
    context 'Returns false if the input is zero' do
      it do
        expect(game.check_input(0)).to eq(false)
      end
    end
  end

  describe 'check_input' do
    context 'Returns false if the input is not numeric' do
      it do
        expect(game.check_input("").is_a?(Numeric)).to eq(false)
      end
    end
  end

  describe 'check_input' do
    context 'Returns false if the input is number not between 1 to 9' do
      it do
        expect(game.check_input(10)).to eq(false)
      end
    end
  end

  describe 'check_input' do
    context 'Returns false if the input is empty' do
      it do
        expect(game.check_input(nil)).to eq(false)
      end
    end
  end

  describe 'check_input' do
    context 'Returns false if the input''s length is greater than 1' do
      it do
        expect(game.check_input(56)).to eq(false)
      end
    end
  end
end