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
