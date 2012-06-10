// ANTLR Lexer for Shakespeare Programming Language

lexer grammar TLexer;

options {

   language= Java;  // Default

   // Tell ANTLR to make the generated lexer class extend the
   // the named class, which is where any supporting code and 
   // variables will be placed.
   //
   superClass= AbstractTLexer;
}

// What package should the generated source exist in?
//
@header {

    package org.shakespearelang.bard;
}

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
    | 'Regan'
    | 'Robin'
    | 'romeo'
    | 'Rosalind'
    | 'sebastian'
    | 'shallow'
    | 'shylock'
    | 'slender'
    | 'solinus'
    | 'stephano'
    | 'thaisa'
    | 'the abbot of westminster'
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
Symbol :  '\u0021'..'\u002B' | '-' | '/' | '\u003C'..'\u0040' | '\u005B'..'\u0060' | '\u007B'..'\u007F';


