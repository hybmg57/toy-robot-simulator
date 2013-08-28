require_relative '../spec_helper'

require 'commands'

describe Commands do
	
	let(:command){ Commands.new }

	before do
		board = Board.new(5,5)
		@robot = Robot.new(board)
	end	

	describe '#initialize' do
		it 'should initialize' do
			expect(command)
		end
	end

	describe '#instructions' do
		it 'should return instructions' do
			expect(command.instructions).to be_true
		end
	end

	describe '#process' do
		context 'before placed' do
			it 'does not move' do
				expect(command.move).to eq(nil)
			end

			it 'does not turn left' do
				expect(command.left).to eq(nil)
			end

			it 'does not turn right' do
				expect(command.right).to eq(nil)
			end

			it 'does not report' do
				expect(command.report).to eq(nil)
			end
		end

		subject(:process){ command.process("place 3,3,north") }

		context 'after placed' do
			it 'should place the robot on wrong position' do
				output = command.capture_stdout{ command.process("place 3,3,wrong") }
				expect(output).to eq("Not placed. Please provide valid arguments\n")
			end

			it 'should place the robot on right position' do
				expect(process).to eq(nil)
			end

			it 'should move forward' do
				process
				expect(command.move).to eq([3, 4, Direction::NORTH])
			end

			it 'should turn left' do
				process
				expect(command.left).to eq([3, 3, Direction::WEST])
			end

			it 'should turn right' do
				process
				expect(command.right).to eq([3, 3, Direction::EAST])
			end

			it 'should report current position' do
				process
				output = command.capture_stdout{ command.report }
				expect(output).to eq("3, 3, north\n")
			end
		end
	end

	subject(:place){ command.place("3,2,west") }

	describe '#place' do
		it 'should move forward' do
			place
			expect(command.move).to eq([2, 2, Direction::WEST])
		end

		it 'should turn left' do
			place
			expect(command.left).to eq([3, 2, Direction::SOUTH])
		end

		it 'should turn right' do
			place
			expect(command.right).to eq([3, 2, Direction::NORTH])
		end

		it 'should report current position' do
			place
			output = command.capture_stdout{ command.report }
			expect(output).to eq("3, 2, west\n")
		end
	end

	describe '#move' do
		it 'should move' do
			place
			expect(command.move).to eq([2, 2, Direction::WEST])
		end
	end

	describe '#left' do
		it 'should left' do
			place
			expect(command.left).to eq([3, 2, Direction::SOUTH])
		end
	end

	describe '#right' do
		it 'should right' do
			place
			expect(command.right).to eq([3, 2, Direction::NORTH])
		end
	end

	describe '#report' do
		it 'should report current position' do
			place
			output = command.capture_stdout{ command.report }
			expect(output).to eq("3, 2, west\n")
		end
	end

end