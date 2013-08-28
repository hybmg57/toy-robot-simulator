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
			it 'does not do anything before placed' do
				expect(command.move).to eq(nil)
			end
		end

		subject(:place){ command.process("place 3,3,north") }

		context 'after placed' do
			it 'place the robot on wrong position' do
				expect(command.process("place 3,3,wrong")).to eq(nil)
			end

			it 'place the robot on right position' do
				expect(place).to eq(nil)
			end

			it 'move forward' do
				place
				expect(command.move).to eq([3,4,:north])
			end

			it 'turn left' do
				place
				expect(command.left).to eq([3,3,:west])
			end

			it 'turn right' do
				place
				expect(command.right).to eq([3,3,:east])
			end

			it 'report current position' do
				place
				puts $stderr.puts()
			end
		end
	end

end