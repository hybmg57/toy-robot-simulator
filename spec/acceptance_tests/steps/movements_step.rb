require_relative '../../spec_helper'
require 'board'

Given(/^a robot is faced north and placed at (\d+),(\d+)$/) do |arg1, arg2|
  @board = Board.new
  @borad.place
end

When(/^the robot moves forward$/) do
  @robot.move
end

Then(/^the robot's location should be (\d+),(\d+) faced north$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
