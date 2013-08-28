require 'active_model'
require_relative 'board'
require_relative 'direction'
require_relative 'report'

# Contains all base action methods to support robot and other objects in future
class Actions
	include ActiveModel::Validations

	attr_accessor :x_coordinate, :y_coordinate, :direction, :placed

	validates :x_coordinate, presence: true, numericality: { only_integer: true }
	validates :y_coordinate, presence: true, numericality: { only_integer: true }

	def initialize(landscape)
		@landscape = landscape
		@map = Direction::Map.new
		self
	end

	def place(x_coordinate, y_coordinate, direction = :north)
		begin
			if within_range(x_coordinate, y_coordinate, direction)
				@placed = true
				report
			end
		rescue
			raise ArgumentError
		end
	end

	def within_range(x_coordinate, y_coordinate, direction)
		self.x_coordinate, self.y_coordinate, self.direction = x_coordinate, y_coordinate, direction if
		x_coordinate.between?(@landscape.left_limit, @landscape.right_limit) && 
		y_coordinate.between?(@landscape.bottom_limit, @landscape.top_limit) &&
		@map.directions.grep(direction).present?
	end

	def left
		self.direction = @map.left(self.direction)
		report
	end

	def right
		self.direction = @map.right(self.direction)
		report
	end

	def move_forward(unit = 1)
		x_coord, y_coord, direct = self.x_coordinate, self.y_coordinate, self.direction

		case direct
		when Direction::SOUTH
			place(x_coord, y_coord - unit, direct)
		when Direction::EAST
			place(x_coord + unit, y_coord, direct)
		when Direction::NORTH
			place(x_coord, y_coord + unit, direct)
		when Direction::WEST
			place(x_coord - unit, y_coord, direct)
		end
	end

	def report_current_position
		"#{@report.join(', ')}" if @report
	end

	def report
		@report = Report.new(self.x_coordinate, self.y_coordinate, self.direction).to_a 
	end

end