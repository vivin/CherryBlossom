#
# cherry-blossom.pl
#
# Written by Vivin S. Paliath 
# Finished: March 2nd, 2010
#
# http://vivin.net/projects/cherryblossom
#
# Copyright 2010 Vivin Suresh Paliath. 
# Distributed under GPLv3
#
#

#!/usr/bin/perl

 use strict;
 use Getopt::Mixed;
 use Term::ReadKey;
 use Lingua::EN::Syllable;

 my %override = (
    "absorbed" => 2,
    "acknowledged" => 3,
    "acknowledgement" => 4,
    "annexed" => 2,
    "answered" => 2,
    "asked" => 1,
    "beautify" => 3,
    "beautified" => 3,
    "beautifies" => 3,
    "beautiful" => 3,
    "beauty" => 2,
    "bloomed" => 1,
    "branched" => 1,
    "caressed" => 2,
    "chilled" => 1,
    "conquered" => 2,
    "contemplates" => 3,
    "decides" => 2,
    "depressed" => 2,
    "doves" => 1,
    "dying" => 1,
    "evening" => 2,
    "filled" => 1,
    "flowered" => 2,
    "flying" => 2,
    "fogged" => 1,
    "frightened" => 2,
    "gained" => 1,
    "healed" => 1,
    "homecoming" => 3,
    "laughed" => 1,
    "learned" => 1,
    "lessened" => 1,
    "loved" => 1,
    "loves" => 1,
    "lowered" => 2,
    "missed" => 1,
    "mulled" => 1,
    "owned" => 1,
    "pleased" => 1,
    "poet" => 2,
    "pushed" => 1,
    "questioned" => 2,
    "rained" => 1,
    "received" => 2,
    "receives" => 2,
    "remembered" => 3,
    "removes" => 2,
    "restored" => 2,
    "restores" => 2,
    "returned" => 2,
    "reunited" => 3,
    "screamed" => 2,
    "showed" => 1,
    "smiled" => 1,
    "smiles" => 1,
    "snowed" => 1,
    "steamed" => 1,
    "sucked" => 1,
    "sweetened" => 2,
    "takes" => 1,
    "thinned" => 1,
    "wondered" => 2,
    "writes" => 1
 );
 
 my %vocabulary = (
    "above" => ">",
    "ahead" => ">",
    "atmosphere" => ">",
    "bird" => ">",
    "birds" => ">",
    "flew" => ">",
    "flies" => ">",
    "flight" => ">",
    "float" => ">",
    "floated" => ">",
    "floating" => ">",
    "floats" => ">",
    "fly" => ">",
    "flew" => ">",
    "flying" => ">",
    "forward" => ">",
    "front" => ">",
    "heaven" => ">",
    "heavenly" => ">",
    "height" => ">",
    "high" => ">",
    "higher" => ">",
    "hill" => ">",
    "hillside" => ">",
    "hilltop" => ">",
    "mountain" => ">",
    "mountainside" => ">",
    "mountaintop" => ">",
    "push" => ">",
    "pushed" => ">",
    "pushes" => ">",
    "pushing" => ">",
    "rise" => ">",
    "rises" => ">",
    "rising" => ">",
    "sky" => ">",
    "top" => ">",
    "up" => ">",
    "upward" => ">",
    "upwards" => ">",
    "back" => "<",
    "backward" => "<",
    "backwards" => "<",
    "behind" => "<",
    "below" => "<",
    "dip" => "<",
    "down" => "<",
    "downwards" => "<",
    "earth" => "<",
    "fall" => "<",
    "falling" => "<",
    "falls" => "<",
    "fell" => "<",
    "ground" => "<",
    "grounded" => "<",
    "land" => "<",
    "landed" => "<",
    "landing" => "<",
    "lands" => "<",
    "low" => "<",
    "lower" => "<",
    "lowered" => "<",
    "lowering" => "<",
    "lowers" => "<",
    "pull" => "<",
    "rain" => "<",
    "rained" => "<",
    "rainfall" => "<",
    "raining" => "<",
    "rains" => "<",
    "reverse" => "<",
    "sink" => "<",
    "sinking" => "<",
    "sinks" => "<",
    "snake" => "<",
    "snow" => "<",
    "snowed" => "<",
    "snowfall" => "<",
    "snowing" => "<",
    "snows" => "<",
    "valley" => "<",
    "waterfall" => "<",
    "alive" => "+",
    "add" => "+",
    "added" => "+",
    "adding" => "+",
    "adds" => "+",
    "beautified" => "+",
    "beautifies" => "+",
    "beautiful" => "+",
    "beautify" => "+",
    "beautifying" => "+",
    "beauty" => "+",
    "butterfly" => "+",
    "butterflies" => "+",
    "big" => "+",
    "bigger" => "+",
    "bloom" => "+",
    "bloomed" => "+",
    "blooming" => "+",
    "blooms" => "+",
    "blossom" => "+",
    "blossoming" => "+",
    "blossoms" => "+",
    "caress" => "+",
    "caressed" => "+",
    "caresses" => "+",
    "caressing" => "+",
    "cherry-blossom" => "+",
    "cherry-blossoms" => "+",
    "dawn" => "+",
    "day" => "+",
    "daybreak" => "+",
    "days" => "+",
    "dove" => "+",
    "doves" => "+",
    "dream" => "+",
    "dreaming" => "+",
    "dreams" => "+",
    "dreamy" => "+",
    "fat" => "+",
    "fattening" => "+",
    "fatty" => "+",
    "field" => "+",
    "fields" => "+",
    "fire" => "+",
    "flower" => "+",
    "flowered" => "+",
    "flowering" => "+",
    "flowers" => "+",
    "fragrance" => "+",
    "fragrant" => "+",
    "gain" => "+",
    "gained" => "+",
    "gains" => "+",
    "get" => "+",
    "gets" => "+",
    "getting" => "+",
    "good" => "+",
    "grew" => "+",
    "grow" => "+",
    "growing" => "+",
    "grows" => "+",
    "had" => "+",
    "happiness" => "+",
    "happy" => "+",
    "have" => "+",
    "having" => "+",
    "heal" => "+",
    "healed" => "+",
    "healing" => "+",
    "heals" => "+",
    "heat" => "+",
    "heated" => "+",
    "heats" => "+",
    "hot" => "+",
    "jasmine" => "+",
    "learn" => "+",
    "learning" => "+",
    "learns" => "+",
    "life" => "+",
    "live" => "+",
    "love" => "+",
    "loved" => "+",
    "lovely" => "+",
    "loves" => "+",
    "loving" => "+",
    "lush" => "+",
    "many" => "+",
    "money" => "+",
    "more" => "+",
    "morning" => "+",
    "new" => "+",
    "own" => "+",
    "owned" => "+",
    "owning" => "+",
    "owns" => "+",
    "pleased" => "+",
    "pleasing" => "+",
    "pleasure" => "+",
    "positive" => "+",
    "pretty" => "+",
    "rainbow" => "+",
    "rainbows" => "+",
    "remember" => "+",
    "remembered" => "+",
    "remembering" => "+",
    "remembers" => "+",
    "rose" => "+",
    "roses" => "+",
    "rosy" => "+",
    "smile" => "+",
    "smiled" => "+",
    "smiles" => "+",
    "smiling" => "+",
    "spring" => "+",
    "steam" => "+",
    "steamed" => "+",
    "steams" => "+",
    "steamy" => "+",
    "summer" => "+",
    "sun" => "+",
    "sunlight" => "+",
    "sunlit" => "+",
    "sunray" => "+",
    "sunrays" => "+",
    "sunshine" => "+",
    "sweet" => "+",
    "sweeten" => "+",
    "sweetened" => "+",
    "sweeter" => "+",
    "sweetly" => "+",
    "sweets" => "+",
    "warm" => "+",
    "warmth" => "+",
    "wealth" => "+",
    "alone" => "-",
    "autumn" => "-",
    "anger" => "-",
    "angry" => "-",
    "bad" => "-",
    "barren" => "-",
    "break" => "-",
    "broke" => "-",
    "broken" => "-",
    "cold" => "-",
    "cool" => "-",
    "chill" => "-",
    "chilled" => "-",
    "chills" => "-",
    "chilly" => "-",
    "cried" => "-",
    "cry" => "-",
    "crying" => "-",
    "dark" => "-",
    "darkening" => "-",
    "darker" => "-",
    "dead" => "-",
    "death" => "-",
    "desert" => "-",
    "deserts" => "-",
    "desolate" => "-",
    "desolation" => "-",
    "depressed" => "-",
    "depressing" => "-",
    "die" => "-",
    "dies" => "-",
    "dusk" => "-",
    "dying" => "-",
    "evening" => "-",
    "evil" => "-",
    "fear" => "-",
    "fearful" => "-",
    "few" => "-",
    "fog" => "-",
    "fogged" => "-",
    "foggy" => "-",
    "forget" => "-",
    "forgetful" => "-",
    "forgetting" => "-",
    "forgot" => "-",
    "forgotten" => "-",
    "forsake" => "-",
    "forsaken" => "-",
    "freeze" => "-",
    "freezing" => "-",
    "freezes" => "-",
    "froze" => "-",
    "frozen" => "-",
    "fright" => "-",
    "frighten" => "-",
    "frightened" => "-",
    "frightening" => "-",
    "gloom" => "-",
    "gloomy" => "-",
    "greed" => "-",
    "greedy" => "-",
    "ice" => "-",
    "icy" => "-",
    "less" => "-",
    "lessen" => "-",
    "lessened" => "-",
    "lone" => "-",
    "lonely" => "-",
    "lonesome" => "-",
    "lose" => "-",
    "losing" => "-",
    "loss" => "-",
    "lost" => "-",
    "melancholy" => "-",
    "miss" => "-",
    "missed" => "-",
    "misses" => "-",
    "missing" => "-",
    "mist" => "-",
    "mistake" => "-",
    "mistaken" => "-",
    "misted" => "-",
    "mists" => "-",
    "misty" => "-",
    "moon" => "-",
    "moonlight" => "-",
    "moonlit" => "-",
    "moonshine" => "-",
    "nothing" => "-",
    "night" => "-",
    "nightfall" => "-",
    "nightmare" => "-",
    "old" => "-",
    "pain" => "-",
    "painful" => "-",
    "poor" => "-",
    "poverty" => "-",
    "rage" => "-",
    "remove" => "-",
    "removes" => "-",
    "removing" => "-",
    "sad" => "-",
    "sadness" => "-",
    "scream" => "-",
    "screamed" => "-",
    "screams" => "-",
    "screaming" => "-",
    "shrank" => "-",
    "shrink" => "-",
    "shrinking" => "-",
    "shrinks" => "-",
    "shrunk" => "-",
    "small" => "-",
    "smaller" => "-",
    "sorrow" => "-",
    "sorrowful" => "-",
    "tear" => "-",
    "tearful" => "-",
    "teary" => "-",
    "thin" => "-",
    "thins" => "-",
    "thinned" => "-",
    "thinning" => "-",
    "ugliness" => "-",
    "ugly" => "-",
    "winter" => "-",
    "wither" => "-",
    "withering" => "-",
    "withers" => "-",
    "wound" => "-",
    "wounded" => "-",
    "wounds" => "-",
    "answer" => ".",
    "answered" => ".",
    "answering" => ".",
    "answers" => ".",
    "art" => ".",
    "artist" => ".",
    "author" => ".",
    "birdsong" => ".",
    "book" => ".",
    "brook" => ".",
    "creek" => ".",
    "display" => ".",
    "displaying" => ".",
    "displays" => ".",
    "flow" => ".",
    "flowing" => ".",
    "flows" => ".",
    "gave" => ".",
    "give" => ".",
    "giving" => ".",
    "laugh" => ".",
    "laughed" => ".",
    "laughing" => ".",
    "laughs" => ".",
    "laughter" => ".",
    "letter" => ".",
    "melodious" => ".",
    "melody" => ".",
    "music" => ".",
    "paint" => ".",
    "painter" => ".",
    "painting" => ".",
    "paints" => ".",
    "picture" => ".",
    "poem" => ".",
    "poet" => ".",
    "present" => ".",
    "respond" => ".",
    "result" => ".",
    "river" => ".",
    "riverside" => ".",
    "said" => ".",
    "say" => ".",
    "saying" => ".",
    "says" => ".",
    "show" => ".",
    "showed" => ".",
    "showing" => ".",
    "shows" => ".",
    "sang" => ".",
    "sight" => ".",
    "sing" => ".",
    "singer" => ".",
    "singing" => ".",
    "sings" => ".",
    "speak" => ".",
    "speaker" => ".",
    "speaking" => ".",
    "speaks" => ".",
    "spoke" => ".",
    "stream" => ".",
    "view" => ".",
    "views" => ".",
    "window" => ".",
    "word" => ".",
    "words" => ".",
    "write" => ".",
    "writer" => ".",
    "writes" => ".",
    "writing" => ".",
    "wrote" => ".",
    "absorb" => ",",
    "absorbed" => ",",
    "absorbing" => ",",
    "absorbs" => ",",
    "accepted" => ",",
    "accepting" => ",",
    "accepts" => ",",
    "annex" => ",",
    "annexed" => ",",
    "annexes" => ",",
    "annexing" => ",",
    "ask" => ",",
    "asked" => ",",
    "asking" => ",",
    "asks" => ",",
    "attract" => ",",
    "attracted" => ",",
    "attracting" => ",",
    "attracts" => ",",
    "conquer" => ",",
    "conquered" => ",",
    "conquering" => ",",
    "conquers" => ",",
    "ditch" => ",",
    "fill" => ",",
    "filled" => ",",
    "filling" => ",",
    "fills" => ",",
    "hear" => ",",
    "hearing" => ",",
    "hears" => ",",
    "hole" => ",",
    "in" => ",",
    "indoor" => ",",
    "indoors" => ",",
    "inside" => ",",
    "knew" => ",",
    "know" => ",",
    "knowing" => ",",
    "knowledge" => ",",
    "knows" => ",",
    "learn" => ",",
    "learned" => ",",
    "learning" => ",",
    "learns" => ",",
    "lesson" => ",",
    "lessons" => ",",
    "question" => ",",
    "questioned" => ",",
    "questioning" => ",",
    "questions" => ",",
    "read" => ",",
    "reader" => ",",
    "reading" => ",",
    "reads" => ",",
    "receive" => ",",
    "received" => ",",
    "receives" => ",",
    "receiving" => ",",
    "suck" => ",",
    "sucked" => ",",
    "sucking" => ",",
    "sucks" => ",",
    "taken" => ",",
    "takes" => ",",
    "taking" => ",",
    "taught" => ",",
    "teach" => ",",
    "teacher" => ",",
    "teaching" => ",",
    "took" => ",",
    "vortex" => ",",
    "whirlpool" => ",",
    "if" => "[",
    "why" => "[",
    "when" => "[",
    "where" => "[",
    "how" => "[",
    "who" => "[",
    "what" => "[",
    "inspect" => "[",
    "puzzle" => "[",
    "question" => "[",
    "mull" => "[",
    "riddle" => "[",
    "decide" => "[",
    "branch" => "[",
    "branched" => "[",
    "branches" => "[",
    "branching" => "[",
    "mulled" => "[",
    "mulling" => "[",
    "mulls" => "[",
    "decides" => "[",
    "deciding" => "[",
    "decided" => "[",
    "contemplate" => "[",
    "contemplating" => "[",
    "contemplation" => "[",
    "contemplated" => "[",
    "contemplates" => "[",
    "think" => "[",
    "thinking" => "[",
    "thought" => "[",
    "thinks" => "[",
    "choose" => "[",
    "chose" => "[",
    "choosing" => "[",
    "chooses" => "[",
    "wonder" => "[",
    "wondered" => "[",
    "wondering" => "[",
    "wonders" => "[",
    "return" => "]",
    "home" => "]",
    "reunite" => "]",
    "returns" => "]",
    "returned" => "]",
    "returning" => "]",
    "reunited" => "]",
    "reunites" => "]",
    "reuinting" => "]",
    "acknowledge" => "]",
    "acknowledges" => "]",
    "acknowledged" => "]",
    "acknowledging" => "]",
    "acknowledgement" => "]",
    "homecoming" => "]",
    "retreat" => "]",
    "retreating" => "]",
    "retreats" => "]",
    "retreated" => "]",
    "restore" => "]",
    "restoring" => "]",
    "restored" => "]",
    "restores" => "]",
    "revisit" => "]",
    "revisited" => "]",
    "revisiting" => "]",
    "revisits" => "]",
    "rebound" => "]",
    "rebounded" => "]",
    "rebounding" => "]",
    "rebounds" => "]",
    "boomerang" => "]",
    "about" => "NOP",
    "all" => "NOP",
    "and" => "NOP",
    "am" => "NOP",
    "an" => "NOP",
    "at" => "NOP",
    "as" => "NOP",
    "a" => "NOP",
    "any" => "NOP",
    "are" => "NOP",
    "because" => "NOP",
    "be" => "NOP",
    "by" => "NOP",
    "came" => "NOP",
    "can" => "NOP",
    "come" => "NOP",
    "could" => "NOP",
    "did" => "NOP",
    "do" => "NOP",
    "does" => "NOP",
    "every" => "NOP",
    "everything" => "NOP",
    "for" => "NOP",
    "from" => "NOP",
    "go" => "NOP",
    "he" => "NOP",
    "her" => "NOP",
    "here" => "NOP",
    "hers" => "NOP",
    "him" => "NOP",
    "his" => "NOP",
    "in" => "NOP",
    "i" => "NOP",
    "is" => "NOP",
    "it" => "NOP",
    "man" => "NOP",
    "me" => "NOP",
    "mine" => "NOP",
    "my" => "NOP",
    "no" => "NOP",
    "now" => "NOP",
    "of" => "NOP",
    "one" => "NOP",
    "on" => "NOP",
    "or" => "NOP",
    "our" => "NOP",
    "ours" => "NOP",
    "she" => "NOP",
    "should" => "NOP",
    "some" => "NOP",
    "so" => "NOP",
    "such" => "NOP",
    "that" => "NOP",
    "them" => "NOP",
    "then" => "NOP",
    "the" => "NOP",
    "their" => "NOP",
    "theirs" => "NOP",
    "there" => "NOP",
    "they" => "NOP",
    "this" => "NOP",
    "to" => "NOP",
    "to" => "NOP",
    "us" => "NOP",
    "was" => "NOP",
    "went" => "NOP",
    "were" => "NOP",
    "will" => "NOP",
    "would" => "NOP",
    "with" => "NOP",
    "woman" => "NOP",
    "yes" => "NOP",
    "you" => "NOP",
    "your" => "NOP",
    "yours" => "NOP"
 );

 my %errors = (
                "1" => "Unmatched brackets",
                "2" => "Cherry Blossom is in strict mode! You're using a word that's not part of Cherry Blossom's standard vocabulary."
              );

 my $filename;
 my $buffer;
 my $terminator;
 my $strict_mode;
 my @lines;
 my $error_code = 0;

 if(scalar @ARGV == 0) {
    print "Syntax: cherry-blossom.pl filename [nonstrict]\n";
    exit 1;
 }

 elsif(scalar @ARGV == 1) {
    $filename = $ARGV[0];
 }

 elsif(scalar @ARGV == 2) {
    $filename = $ARGV[0];
    $strict_mode = lc($ARGV[1]) eq "nonstrict";
 } 

 $terminator  = $/;
 undef $/;
 open(IN, "<$filename");
 $buffer = <IN>;
 close(IN);
 @lines = map {$_ =~ s/^\s+//; $_ =~ s/\s+$//; $_ =~ s/[^A-Za-z ]//g; lc($_);} grep(!/^^\s*$/, split(/$terminator/, $buffer));
 $/ = $terminator;
 

 $strict_mode = 1;

 if(&is_haiku(\@lines)) {
    $error_code = &interpret(\@lines, $strict_mode);
 }

 if($error_code > 0) {
    print $errors{$error_code} . "\n";
 }

 # Makes sure code is a valid haiku
 sub is_haiku {
     my @lines = @{$_[0]};
     my @syllables = ("5", "7", "5");
     my $line = 0;
     my $haiku_line = 0;
     my $is_haiku = 1;
     my $syllable_count = 0;
     my @tokens;
     my $i = 0;

     while($is_haiku and $i < scalar(@lines)) {
           $syllable_count = 0;
           @tokens = $lines[$i] =~ /([a-z]+)/g;

           foreach my $token(@tokens) {
               my $number_of_syllables = 0;
               $token =~ s/[^a-z]//g;
               
               if($override{$token}) {
                  $number_of_syllables = $override{$token};
               }

               else {
                  # Lingua::EN:Syllable->syllable returns 2 for vowels. It's strange.
                  $number_of_syllables = (length($token) == 1) ? 1 : syllable($token);
               }
               
               $syllable_count += $number_of_syllables;
           }

           $is_haiku = ($syllable_count == $syllables[$haiku_line]);
           $haiku_line = ($haiku_line + 1) == 3 ? 0 : $haiku_line + 1;
           $i++;
     }

     if(!$is_haiku) {
        print "The following line has $syllable_count syllables. It should have " . $syllables[$haiku_line - 1] . " syllables:\n" . $lines[$i - 1] . "\n";
     }

     elsif($haiku_line > 0) {
        print "Total number of lines need to be a multiple of three.\n";
        $is_haiku = 0;
     }

     close(IN);
     return $is_haiku;
 }

 sub brackets_match {
     my @lines = @{$_[0]};
     my $line = 0;
     my $i = 0;
     my @tokens;
     my $bracket_count = 0;

     while($i < scalar(@lines)) {
        @tokens = $lines[$i] =~ /([a-z]+)/g;

        foreach my $token(@tokens) {
           $bracket_count++ if $vocabulary{$token} eq "[";
           $bracket_count-- if $vocabulary{$token} eq "]";
        }

        $i++;
     }

     return ($bracket_count == 0);
 }

 sub interpret {
     my @lines = @{$_[0]};
     my $strict_mode = $_[1];
     my $all_lines = "";
     my @memory;
     my $pointer = 0;
     my $pc = 0;
     my $error = 0;
     my $error_code = 0;


     if(!&brackets_match(\@lines)) {
        $error = 1;
        $error_code = 1;
     }

     foreach my $line(@lines) { $all_lines = "$all_lines$line " };

     my @tokens = $all_lines =~ /([a-z]+|\.|,|!|\?|-|;|"|'|\(|\))/g;

     while($pc < scalar(@tokens) and !$error) {

         my $token = $tokens[$pc];

         if($vocabulary{$token} eq ">") {
            $pointer = (($pointer + 1) == 30000) ? 0 : ($pointer + 1);
         }

         elsif($vocabulary{$token} eq "<") {
            $pointer = (($pointer - 1) == -1) ? 29999 : ($pointer - 1);
         }

         elsif($vocabulary{$token} eq "+") {
            $memory[$pointer]++;
         }

         elsif($vocabulary{$token} eq "-") {
            $memory[$pointer]--;
         }

         elsif($vocabulary{$token} eq ".") {
            print chr($memory[$pointer]);
         }

         elsif($vocabulary{$token} eq ",") {
            $memory[$pointer] = ord(ReadKey(0));
         }

         elsif($vocabulary{$token} eq "[") {

            if($memory[$pointer] == 0) {

               my $j = $pc;
               while($j < length(@tokens) and $vocabulary{$tokens[$j]} ne "]") {
                  $j++;
               }

               $error_code = ($j == length(@tokens)) ? 1 : 0;
               $error = ($j == length(@tokens));
               $pc = $j;
            }
         }

         elsif($vocabulary{$token} eq "]") {

            if($memory[$pointer] != 0) {

               my $j = $pc;
               while($j > 0 and $vocabulary{$tokens[$j]} ne "[") {
                 $j--;
               }

               $error_code = ($j < 0) ? 1 : 0;
               $error = ($j < 0);
               $pc = ($j - 1);
            }
         }

         elsif(!$vocabulary{$token} && $strict_mode) {
            print "\nIllegal token: $token\n";
            $error = 1;
            $error_code = 2;
         }

         $pc++;
     }

     return $error_code;
 }
