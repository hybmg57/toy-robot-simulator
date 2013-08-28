require_relative '../spec_helper'
require 'direction'

describe Direction do

	let(:map) { Direction::Map.new }

	describe '#directions' do
		it 'returns all possible directions' do
			expect(map.directions).to eq([:south, :east, :north, :west])
		end
	end

	describe '#right' do
		context 'faced south' do
			it 'rotates to west' do
				expect(map.right(Direction::SOUTH)).to eq(Direction::WEST)
			end
		end
		context 'faced west' do
			it 'rotates to north' do
				expect(map.right(Direction::WEST)).to eq(Direction::NORTH)
			end
		end
		context 'faced north' do
			it 'rotates to east' do
				expect(map.right(Direction::NORTH)).to eq(Direction::EAST)
			end
		end
		context 'faced east' do
			it 'rotates to south' do
				expect(map.right(Direction::EAST)).to eq(Direction::SOUTH)
			end
		end
	end

	describe '#left' do
		context 'faced south' do
			it 'rotates to east' do
				expect(map.left(Direction::SOUTH)).to eq(Direction::EAST)
			end
		end
		context 'faced east' do
			it 'rotates to north' do
				expect(map.left(Direction::EAST)).to eq(Direction::NORTH)
			end
		end
		context 'faced north' do
			it 'rotates to west' do
				expect(map.left(Direction::NORTH)).to eq(Direction::WEST)
			end
		end
		context 'faced west' do
			it 'rotates to south' do
				expect(map.left(Direction::WEST)).to eq(Direction::SOUTH)
			end
		end
	end
	
end