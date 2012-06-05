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

fragment
Space  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {skip();}
    ;


// letters and digits
fragment
Letter  :	('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

fragment
Digit :	'0'..'9'
    ;

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
    'Achilles'
    | 'Adonis'
    | 'Adriana'
    | 'Aegeon'
    | 'Aemilia'
    | 'Agamemnon'
    | 'Agrippa'
    | 'Ajax'
    | 'Alonso'
    | 'Andromache'
    | 'Angelo'
    | 'Antiochus'
    | 'Antonio'
    | 'Arthur'
    | 'Autolycus'
    | 'Balthazar'
    | 'Banquo'
    | 'Beatrice'
    | 'Benedick'
    | 'Benvolio'
    | 'Bianca'
    | 'Brabantio'
    | 'Brutus'
    | 'Capulet'
    | 'Cassandra'
    | 'Cassius'
    | 'Christopher Sly'
    | 'Cicero'
    | 'Claudio'
    | 'Claudius'
    | 'Cleopatra'
    | 'Cordelia'
    | 'Cornelius'
    | 'Cressida'
    | 'Cymberline'
    | 'Demetrius'
    | 'Desdemona'
    | 'Dionyza'
    | 'Doctor Caius'
    | 'Dogberry'
    | 'Don John'
    | 'Don Pedro'
    | 'Donalbain'
    | 'Dorcas'
    | 'Duncan'
    | 'Egeus'
    | 'Emilia'
    | 'Escalus'
    | 'Falstaff'
    | 'Fenton'
    | 'Ferdinand'
    | 'Ford'
    | 'Fortinbras'
    | 'Francisca'
    | 'Friar John'
    | 'Friar Laurence'
    | 'Gertrude'
    | 'Goneril'
    | 'Hamlet'
    | 'Hecate'
    | 'Hector'
    | 'Helen'
    | 'Helena'
    | 'Hermia'
    | 'Hermonie'
    | 'Hippolyta'
    | 'Horatio'
    | 'Imogen'
    | 'Isabella'
    | 'John of Gaunt'
    | 'John of Lancaster'
    | 'Julia'
    | 'Juliet'
    | 'Julius Caesar'
    | 'King Henry'
    | 'King John'
    | 'King Lear'
    | 'King Richard'
    | 'Lady Capulet'
    | 'Lady Macbeth'
    | 'Lady Macduff'
    | 'Lady Montague'
    | 'Lennox'
    | 'Leonato'
    | 'Luciana'
    | 'Lucio'
    | 'Lychorida'
    | 'Lysander'
    | 'Macbeth'
    | 'Macduff'
    | 'Malcolm'
    | 'Mariana'
    | 'Mark Antony'
    | 'Mercutio'
    | 'Miranda'
    | 'Mistress Ford'
    | 'Mistress Overdone'
    | 'Mistress Page'
    | 'Montague'
    | 'Mopsa'
    | 'Oberon'
    | 'Octavia'
    | 'Octavius Caesar'
    | 'Olivia'
    | 'Ophelia'
    | 'Orlando'
    | 'Orsino'
    | 'Othello'
    | 'Page'
    | 'Pantino'
    | 'Paris'
    | 'Pericles'
    | 'Pinch'
    | 'Polonius'
    | 'Pompeius'
    | 'Portia'
    | 'Priam'
    | 'Prince Henry'
    | 'Prospero'
    | 'Proteus'
    | 'Publius'
    | 'Puck'
    | 'Queen Elinor'
    | 'Regan'
    | 'Robin'
    | 'Romeo'
    | 'Rosalind'
    | 'Sebastian'
    | 'Shallow'
    | 'Shylock'
    | 'Slender'
    | 'Solinus'
    | 'Stephano'
    | 'Thaisa'
    | 'The Abbot of Westminster'
    | 'The Apothecary'
    | 'The Archbishop of Canterbury'
    | 'The Duke of Milan'
    | 'The Duke of Venice'
    | 'The Ghost'
    | 'Theseus'
    | 'Thurio'
    | 'Timon'
    | 'Titania'
    | 'Titus'
    | 'Troilus'
    | 'Tybalt'
    | 'Ulysses'
    | 'Valentine'
    | 'Venus'
    | 'Vincentio'
    | 'Viola'
;

First_person:
    'I'
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
    'Hell'
    | 'Microsoft'
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
    'Heaven'
    | 'King'
    | 'Lord'
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
If_not : 'if' Space 'not';
If_so : 'if' Space 'so' ;
Less : 'less' ;
Let_us : 'let' Space 'us' ;
Listen_to : 'listen' Space 'to' ;
Mind : 'mind' ;
More : 'more' ;
Not : 'not' ;
Open : 'open' ;
Proceed_to : 'proceed' Space 'to' ;
Recall : 'recall' ;
Remember : 'remember' ;
Return_to : 'return' Space 'to' ;
Speak : 'speak' ;
Than : 'than' ;
The_cube_of : 'the' Space 'cube' Space 'of' ;
The_difference_between : 'the' Space 'difference' Space 'between' ;
The_factorial_of : 'the' Space 'factorial' Space 'of' ;
The_product_of : 'the' Space 'product' Space 'of' ;
The_quotient_between : 'the' Space 'quotient' Space 'between' ;
The_remainder_of_the_quotient_between : 'the' Space 'remainder' Space 'of' Space 'the' Space 'quotient' Space 'between' ;
The_square_of : 'the' Space 'square' Space 'of' ;
The_square_root_of : 'the' Space 'square' Space 'root' Space 'of' ;
The_sum_of : 'the' Space 'sum' Space 'of' ;
Twice : 'twice' ;
We_must : 'we' Space 'must' ;
We_shall : 'we' Space 'shall' ;


Colon : ':' ;
Comma : ',' ;
Exclamation_mark : '!';
Left_bracket : '[';
Period : '.';
Question_mark : '?';
Right_bracket : ']';

Act_roman : 'act' Space Roman_number;
Scene_roman : 'scene' Space Roman_number;

Nonmatch : Letter (Letter | Digit)*  /* |  0 .. 0xff */;

