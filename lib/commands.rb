require 'thor'

require_relative 'robot'

# Routes command line interface inputs to available class methods
class Commands < Thor

	attr_accessor :robot

	def initialize(*args)
		super
		board = Board.new(5, 5)
		@robot = Robot.new(board)
	end

	default_task :begin

	desc "begin the simulation", "receives commands, transforms those commands into actions"
	def begin
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
				x_coordinate = argument[0].to_i
				y_coordinate = argument[1].to_i
				direction = argument[2].downcase.to_sym
				puts "Not placed. Please provide valid arguments" unless @robot.place(x_coordinate, y_coordinate, direction)
			rescue StandardError => e
				raise e
			end
		end

		def move
			@robot.move_forward if @robot.placed
		end

		def left
			@robot.left if @robot.placed
		end

		def right
			@robot.right if @robot.placed
		end

		def report
			puts @robot.report_current_position if @robot.placed
		end

		def invalid_command(name)
			puts "Invalid command: #{name} is not recognised."
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

		def capture_stdout(&block)
			original_stdout = $stdout
			$stdout = fake = StringIO.new
			begin
				yield
			ensure
				$stdout = original_stdout
			end
			fake.string
		end
	end


end