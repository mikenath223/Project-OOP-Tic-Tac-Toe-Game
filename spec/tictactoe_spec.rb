require './lib/logic.rb'
# require './bin/main.rb'


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
end

RSpec.describe TicTacToe::Game do
  let(:player) { TicTacToe::Game.new }
  let(:board) {[[1, 2, 3], [4, 5, 6], [7, 8, 9]]}
  
end