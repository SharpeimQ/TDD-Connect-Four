# frozen_string_literal: true

require 'colorize'

require_relative '../lib/connect_four'
require_relative '../lib/player'
require_relative '../lib/computer'

describe Board do
  describe 'win_conditions' do
    subject(:game) { described_class.new(Player) }
    let(:player) { instance_double(Player, token: '⬛'.colorize(:blue)) }
    let(:computer) { instance_double(Computer, token: '⬛'.colorize(:red)) }

    context 'when a horizontal win condition is met' do
      it 'returns true' do
        game.board[1] = [player.token, player.token, player.token, player.token]
        expect(game.win_conditions).to be(true)
      end
    end

    context 'when vertical win condition is met' do
      xit 'returns true' do
        game.board[1] = %w[X O O O]
        game.board[2] = %w[X O O O]
        game.board[3] = %w[X O O O]
        game.board[4] = %w[X O O O]

        expect(game.win_conditions).to be(true)
      end
    end
  end
end
