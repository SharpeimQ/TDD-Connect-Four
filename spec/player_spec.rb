# frozen_string_literal: true

require_relative '../lib/connect_four'
require_relative '../lib/player'
require_relative '../lib/computer'

describe Player do
  describe 'name_checker' do
    context 'names should have no spaces' do
      subject(:player) { described_class.new('default') }
      invalid_name = 'Ronald McDonald'
      invalid_name_two = 'Walter White'
      valid_name = 'Sharpeim'

      before do
        allow(player).to receive(:gets).and_return(invalid_name, invalid_name_two, valid_name)
        allow(player).to receive(:puts)
      end

      it 'loops until a valid name is inputted' do
        player.name_checker(invalid_name)
        player.name_checker(invalid_name_two)

        expect(player.name_checker(valid_name)).to be('Sharpeim')
      end
    end
  end

  describe 'make_move' do
    subject(:player) { described_class.new('player') }

    context 'when moves are between 1 and 4' do
      before do
        allow(player).to receive(:gets).and_return('3')
      end

      it 'allows valid moves between 1 and 4' do
        expect(player.make_move).to be_between(1, 4).inclusive
      end
    end

    context 'when moves are not between 1 and 4' do
      before do
        allow(player).to receive(:gets).and_return('100', '0', '5', '4')
      end

      it 'rejects invalid moves and loops a prompt until valid move' do
        expect(player).to receive(:puts).with('Invalid move. Try again:').exactly(3).times

        expect(player.make_move).to be_between(1, 4).inclusive
      end
    end
  end
end
