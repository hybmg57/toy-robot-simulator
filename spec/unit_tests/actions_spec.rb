require_relative '../spec_helper'
require 'board'
require 'actions'
require 'direction'
require 'report'

describe Board do
	
	let(:board) { Board.new(5, 5) }
	let(:action) { Actions.new(board) }
	
	describe 'validations' do
		it 'should not exceed top limit' do
			expect(action.place(1, 6)).to be_false
		end	

		it 'should not exceed bottom limit' do
			expect(action.place(1, 0)).to be_false
		end
		
		it 'should not exceed right limit' do
			expect(action.place(6, 1)).to be_false
		end
		
		it 'should not exceed left limit' do
			expect(action.place(0, 1)).to be_false
		end

		it 'should place robot within its limits' do
			expect(action.place(1, 1)).to be_true
		end

		it 'should not accept non-integer values' do
			expect{action.place('a', 'b')}.to raise_error(ArgumentError)
		end
	end

	describe '#place' do
		it 'place the robot on the board facing south' do
			expect(action.place(1, 1, Direction::SOUTH)).to be_true
		end
	end

	describe '#left' do
		it 'should turn left' do
			action.place(1, 1, Direction::NORTH)
			expect(action.left).to eq([1, 1, Direction::WEST])
		end
	end

	describe '#right' do
		it 'should turn right' do
			action.place(1, 1, Direction::NORTH)
			expect(action.right).to eq([1, 1, Direction::EAST])
		end
	end

	describe '#report' do
		it 'should return position' do
			action.place(3, 4, Direction::WEST)
			expect(action.report).to eq([3, 4, :west])
		end
	end
end