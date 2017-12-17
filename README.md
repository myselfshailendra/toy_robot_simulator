# INSTRUCTIONS:

#### After cloning this application it need to bundle gems.
$ bundle install

#### To Run the program use below command:
$ ruby robot_simulator.rb

#### To Run all Rspec Test Cases use below command:
$ rspec spec


# DESCRIPTION:

When this program runs it asks input for robot commands like below:

Enter your command:
>

Now,

1 - First command will be "PLACE X,Y,F" for placing robot on table otherwise it ignores all other commands.

2 - If we run commands in proper syntax without missing spelling, it act accordingly otherwise returns "Invalid Command!" or other appropriate error.

3 - Only "REPORT" command shows robot position, other valid commands just accept input and act accordingly.

4 - This program will exit with "EXIT" command.

Below digram is showing the directional situation of table:

                                                      NORTH
                                                        ^
                                                        |
                                                        |
            ^                          WEST  < ---------|--------- >  EAST
            |                                           |
            |                                           |
            |-----|-----|-----|-----|-----|             v
            | 0,4 | 1,4 | 2,4 | 3,4 | 4,4 |           SOUTH
            |-----|-----|-----|-----|-----|                          
            | 0,3 | 1,3 | 2,3 | 3,3 | 4,3 |
            |-----|-----|-----|-----|-----|
            | 0,2 | 1,2 | 2,2 | 3,2 | 4,2 |
            |-----|-----|-----|-----|-----|
            | 0,1 | 1,1 | 2,1 | 3,1 | 4,1 |
            |-----|-----|-----|-----|-----|
            | 0,0 | 1,0 | 2,0 | 3,0 | 4,0 |
     < -----|-----|-----|-----|-----|-----|-------- >
            |
            |
            v


#### Some Tested Input and Output Examples based on above 5 units X 5 units diagram:

a).

*Enter your command:*

*> PLACE 2,3,WEST*

*> MOVE*

*> RIGHT*

*> MOVE*

*> REPORT*

*POSITION = (1,4) NORTH*


b).

*Enter your command:*

*> PLACE 3,3,EAST*

*> MOVE*

*> MOVE*

*Invalid move! Robot can be fall!*

*> MOVE*

*Invalid move! Robot can be fall!*

*> LEFT*

*> MOVE*

*> MOVE*

*Invalid move! Robot can be fall!*

*> MOVE*

*Invalid move! Robot can be fall!*

*> LEFT*

*> MOVE*

*> REPORT*

*POSITION = (3,4) WEST*


c).

*Enter your command:*

*> PLACE 0,0,NORTH*

*> MOVE*

*> LEFT*

*> MOVE*

*Invalid move! Robot can be fall!*

*> LEFT*

*> MOVE*

*> MOVE*

*Invalid move! Robot can be fall!*

*> RIGHT*

*> MPOVE*

*Invalid command!*

*> MOVE*

*Invalid move! Robot can be fall!*

*> RIGHT*

*> REPORT*

*POSITION = (0,0) NORTH*


d).

*Enter your command:*

*> PLACE 0,2,WEST*

*> MOVE*

*Invalid move! Robot can be fall!*

*> PLACE 4,2,EAST*

*> MOVE*

*Invalid move! Robot can be fall!*

*> MOVE*

*Invalid move! Robot can be fall!*

*> LEFT*

*> MOVE*

*> REPORT*

*POSITION = (4,3) NORTH*
