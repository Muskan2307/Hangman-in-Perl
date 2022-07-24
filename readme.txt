Description of Game:-

-> List of words from where the word to be guessed can be given to user is hardcoded in the program itself
   ("computer", "radio", "communication","animals","month","politics","security","aircraft","concept","illustration")
-> Number of lifelines available are 6 only i.e. atmost 5 wrong attempts to continue and at 6th wrong attempt the game ends and the user will loose
-> All the letters guessed till now will be visible to user (wrong ones also)
-> No lifeline will be cancelled if same wrong letter will be guessed again instead a message will be generated
-> Correct word which the user has to guess will be displayed at the end in case user fails to guess it and loses the game


Style of Coding :-
To create this game I had made a main subroutine which is responsible for the entire process.
I had created 10 other subroutines along with the main to perform the different functionalities accordingly and help the main to operate smoothly.
&main();
#subroutine main responsible for the overall functioning of the whole game
sub main{..}

#subroutine display for displaying no. of lifelines left and hangman's current state in accordance with the number of wrong attempts
sub display(){..}

# subroutine called by display when no wrong attempt is made till to show no. of lifelines left and hangman's current state
sub trial_display_0{..}

# subroutine called by display when no. of wrong attempt made till is one to show no. of lifelines left and hangman's current state
sub trial_display_1{..}

# subroutine called by display when no. of wrong attempts made till are two to show no. of lifelines left and hangman's current state
sub trial_display_2{..}

# subroutine called by display when no. of wrong attempts made till are three to show no. of lifelines left and hangman's current state
sub trial_display_3{..}

# subroutine called by display when no. of wrong attempts made till are four to show no. of lifelines left and hangman's current state
sub trial_display_4{..}

# subroutine called by display when no. of wrong attempts made till are five to show no. of lifelines left and hangman's current state
sub trial_display_5{..}

# subroutine called by display when no. of wrong attempts made till are six to show no. of lifelines left and hangman's current state
sub trial_display_6{..}

# subroutine to check if the user has won by comparing each character of the random word to be guessed and guessed word till now one by one
sub isWin{..}

# subroutine checkpos to fill all the places by the guessed character if exists in actual word or outputing wrong guess otherwise
sub checkpos{..}
