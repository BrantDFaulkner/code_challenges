##Tic Tac Toe
  I designed, coded, and tested this project to meet the specifications  of the prompt. I focused on implementing the solution within a Model View Controller (MVC) paradigm. This allowed the decoupling of the application from the command line user interface.

  For example, I wrote a quick script that would simulate an AI vs. AI match any number of times using the existing models:

```ruby
simulate_ai(1000000)
=>
...
Draws: 999997
Wins: 0
Draws: 999998
Wins: 0
Draws: 999999
Wins: 0
Draws: 1000000
Wins: 0
```

##Prompt

###Tic Tac Toe Game Specifications:
+ Can be played in three modes:
  + Human vs. Human
  + Human vs. Computer
  + Computer vs. Computer
+ Computer Player cannot be beaten
+ Clear user messages
+ Gracefully  handles bad user input
+ User chooses player to go first
+ User chooses marker "X" or "O"

###Code Base Specifications:
+ Maintainable
  + Tested
+ Flexible
  + Decoupled from console

