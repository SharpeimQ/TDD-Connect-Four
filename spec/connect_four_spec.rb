# frozen_string_literal: true

require 'colorize'

require_relative '../lib/connect_four'
require_relative '../lib/player'
require_relative '../lib/computer'

describe Board do
  describe 'win_conditions' do
    subject(:game) { described_class.new }

    context 'when a horizontal win condition is met' do
      it 'returns true' do
        game.board[1] = %w[X X X X]
        expect(game.win_conditions).to be(true)
      end
    end
  end
end
