# frozen_string_literal: true

require 'colorize'

require_relative '../lib/connect_four'
require_relative '../lib/player'
require_relative '../lib/computer'

describe Board do
  subject(:game) { described_class.new(Player) }
  let(:player) { instance_double(Player, token: '⬛'.colorize(:blue)) }
  let(:computer) { instance_double(Computer, token: '⬛'.colorize(:red)) }

  describe 'horizontal_win?' do
    context 'when a horizontal win condition is met' do
      it 'returns true' do
        game.board[1] = [player.token, player.token, player.token, player.token]
        expect(game.horizontal_win?).to be(true)
      end
    end

    context 'when a horizontal win condition is not met' do
      it 'returns false' do
        expect(game.horizontal_win?).to be(false)
      end
    end
  end

  describe 'vertical_win?' do
    context 'when vertical win condition is met' do
      it 'returns true' do
        game.board[1][0] = player.token
        game.board[2][0] = player.token
        game.board[3][0] = player.token
        game.board[4][0] = player.token

        expect(game.vertical_win?).to be(true)
      end
    end

    context 'when vertical win condition is not met' do
      it 'returns false' do
        expect(game.vertical_win?).to_not be(true)
      end
    end

  end

  describe 'diagonal_win?' do
    context 'when diagonal win condition is met' do
      it 'returns true' do
        game.board[1][0] = player.token
        game.board[2][1] = player.token
        game.board[3][2] = player.token
        game.board[4][3] = player.token

        expect(game.diagonal_win?).to be(true)
      end
    end

    context 'when diagonal win condition is met for computer' do
      it 'returns true' do
        game.board[1][3] = computer.token
        game.board[2][2] = computer.token
        game.board[3][1] = computer.token
        game.board[4][0] = computer.token
      end
    end

    context 'when diagonal win condition is not met' do
      it 'returns false' do
        expect(game.diagonal_win?).to_not be(true)
      end
    end
  end
end
