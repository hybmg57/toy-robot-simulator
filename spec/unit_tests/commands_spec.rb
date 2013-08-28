require_relative '../spec_helper'

require 'commands'

describe Commands do
	
	let(:command){ command = Commands.new }

	describe '#instructions' do
		it 'should return instructions' do
			expect(command.instructions).to be_true
		end
	end


end