/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

grammar bard;


// Some imaginary tokens for tree rewrites
//
tokens {
    PLAY;
    TITLE;
    SCENE;
    SCENECONTENTS;
    CHARACTERLIST;
    GOTO;
    LINE;
    EQUALITY;
    IF;
}

// What package should the generated source exist in?
//
@header {

    package org.shakespearelang.bard;
}

startsymbol : play;


play :  act play -> ^( PLAY act play ) |
        title characterdeclarationlist act -> ^( TITLE title characterdeclarationlist act);


title : string endsymbol -> ^(TITLE string);


act : actheader scene -> ^(actheader scene)
    | scene act -> ^(scene act)
;


actheader : Act_roman Colon comment endsymbol -> ^(Act_roman comment);


scene : sceneheader scenecontents -> ^(SCENE sceneheader scenecontents);


scenecontents :  enterexit scenecontents? -> ^(SCENECONTENTS enterexit scenecontents?) |
                 line scenecontents? -> ^(SCENECONTENTS line scenecontents?);


sceneheader : Scene_roman Colon comment endsymbol;


characterdeclarationlist : characterdeclaration+;


characterdeclaration : Character Comma comment endsymbol -> ^(Character comment)
;


characterlist :  c1=Character And c2=Character -> ^(CHARACTERLIST $c1 ^(Character $c2)) |
                Character Comma characterlist -> ^(CHARACTERLIST Character characterlist);


adjective : Positive_adjective |
            Neutral_adjective |
            Negative_adjective;


binaryoperator : The_difference_between |
                  The_product_of |
                  The_quotient_between |
                  The_remainder_of_the_quotient_between |
                  The_sum_of;


comment : string;


string : stringsymbol
    | stringsymbol string -> ^(stringsymbol string);


endsymbol :  questionsymbol |
             statementsymbol;


enterexit :  Left_bracket Enter Character Right_bracket -> ^( Enter Character ) |
             Left_bracket Enter characterlist Right_bracket -> ^( Enter characterlist ) |
             Left_bracket Exit Character Right_bracket -> ^(Exit Character) |
             Left_bracket Exeunt characterlist? Right_bracket -> ^(Exeunt characterlist?)
            ;


line : Character Colon sentencelist -> ^(LINE Character sentencelist);


comparison :  Not nonnegatedcomparison -> ^(Not nonnegatedcomparison) |
              nonnegatedcomparison;


constant :  Article unarticulatedconstant -> ^(Article unarticulatedconstant)|
            First_person_possessive unarticulatedconstant -> ^(First_person_possessive unarticulatedconstant) |
            Second_person_possessive unarticulatedconstant -> ^(Second_person_possessive unarticulatedconstant) |
            Third_person_possessive unarticulatedconstant -> ^(Third_person_possessive unarticulatedconstant) |
            Nothing;



nonnegatedcomparison :  equality |
                        inequality;


equality : As Adjective As -> ^(EQUALITY); 


inequality : comparative Than;


comparative :  negativecomparative |
               positivecomparative;


negativecomparative :  Negative_comparative |
                       More Negative_adjective |
                       Less Positive_adjective;


positivecomparative :  Positive_comparative |
                       More Positive_adjective |
                       Less Negative_adjective;



pronoun :  First_person |
           First_person_reflexive |
           Second_person |
           Second_person_reflexive;


sentencelist : sentence |
               (sentence sentencelist) => sentence sentencelist;


sentence :  (conditional) => conditional Comma unconditionalsentence |
            unconditionalsentence
         ;


conditional :  If_so |
               If_not;


unconditionalsentence :  inout |
                         jump |
                         question |
                         recall |
                         remember |
                         statement;


inout :  openyour Heart statementsymbol |
         Speak Second_person_possessive Mind statementsymbol |
         Listen_to Second_person_possessive Heart statementsymbol |
         openyour Mind statementsymbol;


openyour : Open Second_person_possessive;


jump :  jumpphrase Act_roman statementsymbol -> ^(GOTO Act_roman statementsymbol) |
        jumpphrase Scene_roman statementsymbol^(GOTO Scene_roman statementsymbol) ;


jumpphrase : jumpphrasebeginning jumpphraseend;


jumpphrasebeginning :  Let_us |
                       We_must |
                       We_shall;


jumpphraseend :  Proceed_to |
                 Return_to;


question : Be v1=value comparison v2=value questionsymbol -> ^(IF $v1 comparison $v2);


recall : Recall string statementsymbol -> ^(Recall string statementsymbol);


remember : Remember value statementsymbol;


statement :  Second_person ( Be constant statementsymbol |
                             unarticulatedconstant statementsymbol |
                             Be equality value statementsymbol );


unarticulatedconstant :  (positiveconstant) => positiveconstant |
                         negativeconstant;


positiveconstant :  positivenoun |
                    Positive_adjective positiveconstant |
                    Neutral_adjective positiveconstant;


negativeconstant :  negativenoun |
                    Negative_adjective negativeconstant |
                    Neutral_adjective negativeconstant;


positivenoun :  Neutral_noun |
               Positive_noun;


negativenoun : Negative_noun;


unaryoperator :  The_cube_of |
                 The_factorial_of |
                 The_square_of |
                 The_square_root_of |
                 Twice;


value :  Character |
         constant |
         pronoun |
         binaryoperator value And value |
         unaryoperator value;


stringsymbol :  Article |
                Be |
                Character |
                First_person |
                First_person_possessive |
                First_person_reflexive |
                Negative_adjective |
                Negative_comparative |
                Negative_noun |
                Neutral_adjective |
                Neutral_noun |
                Nothing |
                Positive_adjective |
                Positive_comparative |
                Positive_noun |
                Second_person |
                Second_person_possessive |
                Second_person_reflexive |
                Third_person_possessive |
                Comma |
                And |
                As |
                Enter |
                Exeunt |
                Exit |
                Heart |
                If_not |
                If_so |
                Less |
                Let_us |
                Listen_to |
                Mind |
                More |
                Not |
                Open |
                Proceed_to |
                Recall |
                Remember |
                Return_to |
                Speak |
                Than |
                The_cube_of |
                The_difference_between |
                The_factorial_of |
                The_product_of |
                The_quotient_between |
                The_remainder_of_the_quotient_between |
                The_square_of |
                The_square_root_of |
                The_sum_of |
                Twice |
                We_must |
                We_shall |
                Act_roman |
                Scene_roman |
                Roman_number |
                Nonmatch;

 
questionsymbol : Question_mark;


statementsymbol :  Exclamation_mark |
                   Period;


// Probably overkill because the lexer is made case insensitive
fragment    C : 'c' | 'C' ;
fragment    M : 'm' | 'M' ;
fragment    D : 'd' | 'D'; 
fragment    I : 'i' | 'I';
fragment    X : 'x' | 'X';
fragment    V : 'v' | 'V';
fragment    L : 'l' | 'L';

fragment    Roman_thousands : M+;
fragment    Roman_hundreds : C(D|M) | D | D C | D C C | D C C C | C | C C | C C C ;
fragment    Roman_tens     : X(L|C) | L | L X | L X X | L X X X | X | X X | X X X ;
fragment    Roman_ones     : I(V|X) | V | V I | V I I | V I I I | I | I I | I I I ;
fragment    Roman_number : Roman_ones
                | Roman_tens Roman_ones?
                | Roman_hundreds Roman_tens? Roman_ones?
                | Roman_thousands Roman_hundreds? Roman_tens? Roman_ones?;


Article:
    'a'
    | 'an'
    | 'the'
;

Be:
    'am'
    | 'are'
    | 'art'
    | 'be'
    | 'is'
;

Character:
      'achilles'
    | 'adonis'
    | 'adriana'
    | 'aegeon'
    | 'aemilia'
    | 'agamemnon'
    | 'agrippa'
    | 'ajax'
    | 'alonso'
    | 'andromache'
    | 'angelo'
    | 'antiochus'
    | 'antonio'
    | 'arthur'
    | 'autolycus'
    | 'balthazar'
    | 'banquo'
    | 'beatrice'
    | 'benedick'
    | 'benvolio'
    | 'bianca'
    | 'brabantio'
    | 'brutus'
    | 'capulet'
    | 'cassandra'
    | 'cassius'
    | 'christopher sly'
    | 'cicero'
    | 'claudio'
    | 'claudius'
    | 'cleopatra'
    | 'cordelia'
    | 'cornelius'
    | 'cressida'
    | 'cymberline'
    | 'demetrius'
    | 'desdemona'
    | 'dionyza'
    | 'doctor caius'
    | 'dogberry'
    | 'don john'
    | 'don pedro'
    | 'donalbain'
    | 'dorcas'
    | 'duncan'
    | 'egeus'
    | 'emilia'
    | 'escalus'
    | 'falstaff'
    | 'fenton'
    | 'ferdinand'
    | 'ford'
    | 'fortinbras'
    | 'francisca'
    | 'friar john'
    | 'friar laurence'
    | 'gertrude'
    | 'goneril'
    | 'hamlet'
    | 'hecate'
    | 'hector'
    | 'helen'
    | 'helena'
    | 'hermia'
    | 'hermonie'
    | 'hippolyta'
    | 'horatio'
    | 'imogen'
    | 'isabella'
    | 'john of gaunt'
    | 'john of lancaster'
    | 'julia'
    | 'juliet'
    | 'julius caesar'
    | 'king henry'
    | 'king john'
    | 'king lear'
    | 'king Richard'
    | 'lady capulet'
    | 'lady macbeth'
    | 'lady macduff'
    | 'lady montague'
    | 'lennox'
    | 'leonato'
    | 'luciana'
    | 'lucio'
    | 'lychorida'
    | 'lysander'
    | 'macbeth'
    | 'macduff'
    | 'malcolm'
    | 'mariana'
    | 'mark antony'
    | 'mercutio'
    | 'miranda'
    | 'mistress ford'
    | 'mistress overdone'
    | 'mistress page'
    | 'montague'
    | 'mopsa'
    | 'oberon'
    | 'octavia'
    | 'octavius caesar'
    | 'olivia'
    | 'ophelia'
    | 'orlando'
    | 'orsino'
    | 'othello'
    | 'page'
    | 'pantino'
    | 'paris'
    | 'pericles'
    | 'pinch'
    | 'polonius'
    | 'pompeius'
    | 'portia'
    | 'priam'
    | 'prince henry'
    | 'prospero'
    | 'proteus'
    | 'publius'
    | 'puck'
    | 'queen Elinor'
    | 'regan'
    | 'robin'
    | 'romeo'
    | 'rosalind'
    | 'sebastian'
    | 'shallow'
    | 'shylock'
    | 'slender'
    | 'solinus'
    | 'stephano'
    | 'thaisa'
    | 'the abbot of westminster' // FIXME use inSpace?
    | 'the apothecary'
    | 'the archbishop of canterbury'
    | 'the duke of milan'
    | 'the duke of venice'
    | 'the ghost'
    | 'theseus'
    | 'thurio'
    | 'timon'
    | 'titania'
    | 'titus'
    | 'troilus'
    | 'tybalt'
    | 'ulysses'
    | 'valentine'
    | 'venus'
    | 'vincentio'
    | 'viola'
;

First_person:
    'i'
    | 'me'
;

First_person_possessive:
    'mine'
    | 'my'
;

First_person_reflexive:
    'myself'
;

Negative_adjective:
    'bad'
    | 'cowardly'
    | 'cursed'
    | 'damned'
    | 'dirty'
    | 'disgusting'
    | 'distasteful'
    | 'dusty'
    | 'evil'
    | 'fat'
    | 'fat-kidneyed'
    | 'fatherless'
    | 'foul'
    | 'hairy'
    | 'half-witted'
    | 'horrible'
    | 'horrid'
    | 'infected'
    | 'lying'
    | 'miserable'
    | 'misused'
    | 'oozing'
    | 'rotten'
    | 'smelly'
    | 'snotty'
    | 'sorry'
    | 'stinking'
    | 'stuffed'
    | 'stupid'
    | 'vile'
    | 'villainous'
    | 'worried'
;

Negative_comparative:
    'punier'
    | 'smaller'
    | 'worse'
;

Negative_noun:
    'hell'
    | 'microsoft'
    | 'bastard'
    | 'beggar'
    | 'blister'
    | 'codpiece'
    | 'coward'
    | 'curse'
    | 'death'
    | 'devil'
    | 'draught'
    | 'famine'
    | 'flirt-gill'
    | 'goat'
    | 'hate'
    | 'hog'
    | 'hound'
    | 'leech'
    | 'lie'
    | 'pig'
    | 'plague'
    | 'starvation'
    | 'toad'
    | 'war'
    | 'wolf'
;

Neutral_adjective:
    'big'
    | 'black'
    | 'blue'
    | 'bluest'
    | 'bottomless'
    | 'furry'
    | 'green'
    | 'hard'
    | 'huge'
    | 'large'
    | 'little'
    | 'normal'
    | 'old'
    | 'purple'
    | 'red'
    | 'rural'
    | 'small'
    | 'tiny'
    | 'white'
    | 'yellow'
;

Neutral_noun:
    'animal'
    | 'aunt'
    | 'brother'
    | 'cat'
    | 'chihuahua'
    | 'cousin'
    | 'cow'
    | 'daughter'
    | 'door'
    | 'face'
    | 'father'
    | 'fellow'
    | 'granddaughter'
    | 'grandfather'
    | 'grandmother'
    | 'grandson'
    | 'hair'
    | 'hamster'
    | 'horse'
    | 'lamp'
    | 'lantern'
    | 'mistletoe'
    | 'moon'
    | 'morning'
    | 'mother'
    | 'nephew'
    | 'niece'
    | 'nose'
    | 'purse'
    | 'road'
    | 'roman'
    | 'sister'
    | 'sky'
    | 'son'
    | 'squirrel'
    | 'stone wall'
    | 'thing'
    | 'town'
    | 'tree'
    | 'uncle'
    | 'wind'
;

Nothing:
    'nothing'
    | 'zero'
;

Positive_adjective:
    'amazing'
    | 'beautiful'
    | 'blossoming'
    | 'bold'
    | 'brave'
    | 'charming'
    | 'clearest'
    | 'cunning'
    | 'cute'
    | 'delicious'
    | 'embroidered'
    | 'fair'
    | 'fine'
    | 'gentle'
    | 'golden'
    | 'good'
    | 'handsome'
    | 'happy'
    | 'healthy'
    | 'honest'
    | 'lovely'
    | 'loving'
    | 'mighty'
    | 'noble'
    | 'peaceful'
    | 'pretty'
    | 'prompt'
    | 'proud'
    | 'reddest'
    | 'rich'
    | 'smooth'
    | 'sunny'
    | 'sweet'
    | 'sweetest'
    | 'trustworthy'
    | 'warm'
;

Positive_comparative:
    'better'
    | 'bigger'
    | 'fresher'
    | 'friendlier'
    | 'nicer'
    | 'jollier'
;

Positive_noun:
    'heaven'
    | 'king'
    | 'lord'
    | 'angel'
    | 'flower'
    | 'happiness'
    | 'joy'
    | 'plum'
    | 'summer\'s day'
    | 'hero'
    | 'rose'
    | 'kingdom'
    | 'pony'
;

Second_person:
    'thee'
    | 'thou'
    | 'you'
;

Second_person_possessive:
    'thine'
    | 'thy'
    | 'your'
;

Second_person_reflexive:
    'thyself'
    | 'yourself'
;

Third_person_possessive:
    'his'
    | 'her'
    | 'its'
    | 'their'
;
 

And : 'and' ;
As : 'as' ;
Enter : 'enter' ;
Exeunt : 'exunt';
Exit :'exit' ;
Heart : 'heart';
If_not : 'if'  InSpace 'not';
If_so : 'if'  InSpace 'so' ;
Less : 'less' ;
Let_us : 'let'  InSpace 'us' ;
Listen_to : 'listen'  InSpace 'to' ;
Mind : 'mind' ;
More : 'more' ;
Not : 'not' ;
Open : 'open' ;
Proceed_to : 'proceed'  InSpace 'to' ;
Recall : 'recall' ;
Remember : 'remember' ;
Return_to : 'return'  InSpace 'to' ;
Speak : 'speak' ;
Than : 'than' ;
The_cube_of : 'the'  InSpace 'cube'  InSpace 'of' ;
The_difference_between : 'the'  InSpace 'difference'  InSpace 'between' ;
The_factorial_of : 'the'  InSpace 'factorial'  InSpace 'of' ;
The_product_of : 'the'  InSpace 'product'  InSpace 'of' ;
The_quotient_between : 'the'  InSpace 'quotient'  InSpace 'between' ;
The_remainder_of_the_quotient_between : 'the'  InSpace 'remainder'  InSpace 'of'  InSpace 'the'  InSpace 'quotient'  InSpace 'between' ;
The_square_of : 'the'  InSpace 'square'  InSpace 'of' ;
The_square_root_of : 'the'  InSpace 'square'  InSpace 'root'  InSpace 'of' ;
The_sum_of : 'the'  InSpace 'sum'  InSpace 'of' ;
Twice : 'twice' ;
We_must : 'we'  InSpace 'must' ;
We_shall : 'we'  InSpace 'shall' ;


Colon : ':' ;
Comma : ',' ;
Exclamation_mark : '!'; 
Left_bracket : '[';
Period : '.';
Question_mark : '?';
Right_bracket : ']';

Act_roman : 'act' InSpace Roman_number;
Scene_roman : 'scene' InSpace Roman_number;

fragment
InSpace :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        )+
;

Space  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        )+ {skip();}
    ;

Nonmatch :  (Letter | Digit)+ | Symbol ;


// letters and digits
fragment
Letter  :	('a'..'z'|'A'..'Z')
    ;

fragment
Digit :	'0'..'9'
    ;

fragment
Symbol :  '\u0021'..'\u002B' | '-' | '/' | '\u003C'..'\u0040' | '\u005B'..'\u0060' | '\u007B'..'\u007F' | '\u0080'..'\u00FF';


           