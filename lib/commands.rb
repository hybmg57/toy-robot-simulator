require 'thor'

require_relative 'robot'

# Routes command line interface inputs to available class methods
class Commands < Thor

	attr_accessor :robot

	default_task :begin

	desc "begin the simulation", "receives commands, transforms those commands into actions"
	def begin
		board = Board.new(5, 5)
		@robot = Robot.new(board)
		puts instructions

		while argument = gets
			case argument
			when /exit/i
				puts "bye..."
				break
			else
				process(argument)
			end
		end
	end

	no_tasks do

		InvalidArgument = Class.new(Exception)

		def process(arguments)
			name, argument = nil

			name, argument = arguments.split(" ")
			name = name.downcase if name
			
			case name
			when 'place'
				place(argument)
			when 'move'
				move
			when 'left'
				left
			when 'right'
				right
			when 'report'
				report
			else
				invalid_command(name)
			end
		end

		def place(arguments)
			begin 
				argument = String(arguments).split(",")
				x_coordinate = arguments[0].to_i
				y_coordinate = arguments[1].to_i
				direction = arguments[2].downcase.to_sym
				puts "Not placed. Please provide valid arguments" if @robot.place(x_coordinate, y_coordinate, direction)
			rescue
				puts "Error - Not placed. Please provide valid arguments"
			end
		end

		def move
			return check_if_placed
			@robot.move_forward
		end

		def left
			return check_if_placed
		end

		def right
			return check_if_placed
		end

		def report
			# return check_if_placed
			puts @robot.report_current_position
		end

		def invalid_command(name)
			puts "Invalid command: #{name} is not recognised."
		end

		def check_if_placed
			nil unless @robot.placed == true
		end

		def instructions
			"\nWelcome to Toy Robot Simulator!\n\n"\
			"Below commands are available >> \n"\
			"Placing a robot on the board - [PLACE x-coordinate,y-coordinate,direction] (for example: PLACE 1,1,north)\n"\
			"Moving forward by 1 unit - [MOVE]\n"\
			"Rotate left - [LEFT]\n"\
			"Rotate right - [RIGHT]\n"\
			"Report current position - [REPORT]\n"\
			"Exit - [EXIT]\n"\
			"Enjoy!\n\n"\
		end
	end


end