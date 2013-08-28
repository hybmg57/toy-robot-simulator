require_relative 'actions'
require_relative 'report'
require_relative 'board'

# Contains actions specific to the robot object inherting methods from base class Actions
class Robot < Actions

	attr_accessor :name

	def initialize(landscape, name = 'Jae')
		self.name = name
		@action = super(landscape)
	end

	def left
		super
	end

	def right
		super
	end

	def move_forward
		super
	end

end
