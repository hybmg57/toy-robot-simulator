module Direction
	# Direction module to map directions with left or right turns from current position

	SOUTH = :south
	EAST = :east
	NORTH = :north 
	WEST = :west

	class Map
		def directions
			[SOUTH, EAST, NORTH, WEST]
		end

		def right(direction)
			spin(direction, -1)
		end

		def left(direction)
			spin(direction, 1)
		end

		
		private

		def spin(direction, move)
			match = directions.index(direction)
			rotate = directions.rotate(move)
			rotate[match]
		end
	end
end