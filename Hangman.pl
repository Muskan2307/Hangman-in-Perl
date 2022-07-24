#Muskan 
#2020CSB1100
#Hangman in Perl
#List of words from where the word to be guessed can be given to user is hardcoded in the program itself
#Number of lifelines available are 6 only i.e. atmost 5 wrong attempts to continue and at 6th wrong attempt the game ends and the user will loose
#All the letters guesses till now will be visible to user (wrong ones also)
# No lifeline will be cancelled if same wrong letter will be guessed again instead a message will be generated
# Correct word which the user has to guess will be displayed at the end in case user fails to guess it and loses the game
use strict;
use feature ":5.10";
use experimental qw( switch );
#global variables
my @words = ("computer", "radio", "communication","animals","month","politics","security","aircraft","concept","illustration");
my @guesses = ();
my $solve =0;
my $num =0;
my @arr =();
my $lenarr =0;
&main();
#subroutine main responsible for the overall functioning of the whole game
sub main{
    my $ranword = @words[int(rand(10))];
    my $len = length($ranword);
    for(my $i =0;$i < $len;$i++)
    {
        $guesses[$i] = '_';
    }
    while(!$solve)
    {
        &display($ranword);
        my $presence =0;
        print join(" ",@guesses);
        print "\nAll your previous guesses are listed here: ";
        print join(" ",@arr);
        print "\nEnter the letter you want to continue your game with..\n";
        my $guess = <>;
        chomp($guess);
        for(my $i =0; $i < $lenarr ; $i++)
        {
            if(!$presence)
            {if($arr[$i] eq $guess)
            {
                print "\nYou had already guessed it!!\n";
                $presence=1;
            }}
        }
        if(!$presence)
        {push(@arr,$guess);
        $lenarr=$lenarr+1;
        &checkpos($ranword,$guess);
        $solve = &isWin($ranword);}
    }
    print join(" ",@guesses);
    print "\n Congo!! You Win :)";
}
#subroutine display for displaying no. of lifelines left and hangman's current state in accordance with the number of wrong attempts
sub display()
{
    my ($word)=@_;
    given($num)
    {
        when(0) {
            &trial_display_0();
        }
        when(1) {
            &trial_display_1();
        }
        when(2) {
            &trial_display_2();
        }
        when(3) {
            &trial_display_3();
        }
        when(4) {
            &trial_display_4();
        }
        when(5) {
            &trial_display_5();
        }
        when(6) {
            &trial_display_6($word);
        }
         
    }
}
# subroutine called by display when no wrong attempt is made till to show no. of lifelines left and hangman's current state
sub trial_display_0
{
    print "You have 6 lifelines left!!\n";
    print " --------\n";
    print " |    |\n";
    print " |\n";
    print " |\n";
    print " |\n";
    print " |\n";
    print " |\n";
    print "-|-----\n";
}
# subroutine called by display when no. of wrong attempt made till is one to show no. of lifelines left and hangman's current state
sub trial_display_1
{
    print "You have 5 lifelines left!!\n";
    print " --------\n";
    print " |    |\n";
    print " |    o\n";
    print " |\n";
    print " |\n";
    print " |\n";
    print " |\n";
    print "-|-----\n";
}
# subroutine called by display when no. of wrong attempts made till are two to show no. of lifelines left and hangman's current state
sub trial_display_2
{
    print "You have 4 lifelines left!!\n";
    print " --------\n";
    print " |    |\n";
    print " |    o\n";
    print " |    |\n";
    print " |\n";
    print " |\n";
    print " |\n";
    print "-|-----\n";
}
# subroutine called by display when no. of wrong attempts made till are three to show no. of lifelines left and hangman's current state
sub trial_display_3
{
    print "You have 3 lifelines left!!\n";
    print " --------\n";
    print " |    |\n";
    print " |    o\n";
    print " |   \\|\n";
    print " |\n";
    print " |\n";
    print " |\n";
    print "-|-----\n";
}
# subroutine called by display when no. of wrong attempts made till are four to show no. of lifelines left and hangman's current state
sub trial_display_4
{
    print "You have 2 lifelines left!!\n";
    print " --------\n";
    print " |    |\n";
    print " |    o\n";
    print " |   \\|/\n";
    print " |\n";
    print " |\n";
    print " |\n";
    print "-|-----\n";
}
# subroutine called by display when no. of wrong attempts made till are five to show no. of lifelines left and hangman's current state
sub trial_display_5
{
    print "You have 1 lifeline left!!\n";
    print " --------\n";
    print " |    |\n";
    print " |    o\n";
    print " |   \\|/\n";
    print " |   /\n";
    print " |\n";
    print " |\n";
    print "-|-----\n";
}
# subroutine called by display when no. of wrong attempts made till are six to show no. of lifelines left and hangman's current state
sub trial_display_6
{
    my($word)=@_;
    print "Oops!! You have no lifeline left now!!\n";
    print " --------\n";
    print " |    |\n";
    print " |    o\n";
    print " |   \\|/\n";
    print " |   / \\\n";
    print " |\n";
    print " |\n";
    print "-|-----\n";
    print "Sry :( , you lost !!\n";
    print "The actual word was: $word";
    exit 0;
}
# subroutine to check if the user has won by comparing each character of the random word to be guessed and guessed word till now one by one
sub isWin
{
    my($word) = @_;
    my $letter;
    for(my $i =0; $i < length($word); $i++)
    {
        $letter = substr($word , $i , 1);
        if($letter ne $guesses[$i])
        {
            return 0;
        }
    }
    return 1;
}
# subroutine checkpos to fill all the places by the guessed character if exists in actual word or outputing wrong guess otherwise
sub checkpos
{
    my($actualword,$guessletter) = @_;
    my $wordIndex = index($actualword,$guessletter);
    if($wordIndex == -1)
    {
        print "Oops!! Wrong guess :( \n";
        $num++;
    }
    else
    {
        for(my $i =0; $i < length($actualword); $i++)
        {
            my $let = substr($actualword,$i, 1);
            if($guessletter eq $let)
            {
                $guesses[$i] = $let;
            }
        }
    }
}