require_relative '../spec_helper'

require 'commands'

describe Commands do
	
	let(:command){ command = Commands.new }

	describe '#instructions' do
		it 'should return instructions' do
			expect(command.instructions).to be_true
		end
	end

	describe '#process' do
		it 'place the robot' do
			command.place("place 3,4,north")
		end
	end

end