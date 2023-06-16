# frozen_string_literal: true

require_relative '../lib/connect_four'
require_relative '../lib/player'
require_relative '../lib/computer'

describe Board do
  describe 'win_conditions' do
    context 'when a horizontal win condition is met' do
      subject(:board) { described_class.new }

      it 'returns true' do
        board.instance_variable_get(:@row_one, %w[X X X X])
        expect(board.win_conditions).to be(true)
      end
    end
  end
end
