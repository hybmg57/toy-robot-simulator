require_relative '../spec_helper'
require 'board'

describe Board do
	describe '#initialize' do
		subject(:board) { Board.new }

		it { expect(board.valid?).to be_true }
	end
end