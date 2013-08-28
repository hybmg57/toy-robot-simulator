# Report class to support various reporting method. This class could be utilised for database interaction in future if required.
class Report < Struct.new(:x_coordinate, :y_coordinate, :direction)
end