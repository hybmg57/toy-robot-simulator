require 'active_model'
require_relative 'actions'
require_relative 'report'

# Board class for robot to move around. Validation with the help of ActiveModel
class Board
	include ActiveModel::Validations

	attr_reader :top_limit, :bottom_limit, :left_limit, :right_limit

	validates :top_limit,		presence:true, numericality: {only_integer: true}
	validates :bottom_limit,	presence:true, numericality: {only_integer: true}
	validates :left_limit,		presence:true, numericality: {only_integer: true}
	validates :right_limit,		presence:true, numericality: {only_integer: true}

	def initialize(width = 5, height = 5)
		@bottom_limit, @top_limit = 1, height
		@left_limit, @right_limit = 1, width
	end

end	