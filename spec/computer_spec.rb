# frozen_string_literal: true

require_relative '../lib/connect_four'
require_relative '../lib/player'
require_relative '../lib/computer'

describe Computer do
  subject(:computer) { described_class.new('Terminator') }

  describe 'generate_move' do
    it 'generates a number between 1 and 4' do
      move = computer.generate_move
      expect(move).to be_between(1, 4).inclusive
    end
  end
end