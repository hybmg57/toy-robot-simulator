require_relative '../spec_helper'
require 'robot'
require 'actions'
require 'direction'

describe Robot do
	
	let(:board){ Board.new(5, 5) }
	let(:robot){ Robot.new(board) }
	let(:action){ Actions.new }

	subject(:placement){ robot.place(1, 1, Direction::NORTH) }

	describe '#left' do
		it 'should turn left' do
			placement
			expect(robot.left).to eq(Direction::WEST)
		end
	end

	describe '#right' do
		it 'should turn right' do
			placement
			expect(robot.right).to eq(Direction::EAST)
		end
	end

	describe '#move_forward' do
		it 'moves forward by one on the board at (1, 1, :north) position' do
			placement
			expect(robot.move_forward).to eq([1, 2, Direction::NORTH])
		end
	end

	describe 'Validates movements' do
		it 'does not move beyond allowed range' do
			robot.place(5, 5, Direction::EAST)
			expect(robot.move_forward).to be_false
		end
	end

	describe '#report_current_position' do
		it 'reports the current position of robot' do
			robot.place(5, 1, Direction::EAST)
			robot.report_current_position
		end
	end
end