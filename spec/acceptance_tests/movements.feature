Feature: Movement on the board
  Scenario: Moving north
    Given a robot is faced north and placed at 1,1
    When the robot moves forward
    Then the robot's location should be 2,1 faced north