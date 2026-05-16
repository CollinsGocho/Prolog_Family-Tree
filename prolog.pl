% COMPLETE FAMILY TREE
% Contains: Grandparents, Parents, Children,
%           Grandchildren, Cousins, Uncles, Aunts

% GENDER FACTS
% Grandparents
male(james).
male(robert).
male(thomas).
male(george).
male(peter).
male(mark).
male(johnny).

% Grandmothers
female(mary).
female(helen).
female(patricia).
female(susan).
female(linda).
female(emma).
female(sophia).

% PARENT RELATIONSHIPS
% Generation 1: Grandparents
parent(james, thomas).
parent(mary, thomas).
parent(james, george).
parent(mary, george).
parent(james, susan).
parent(mary, susan).

parent(robert, patricia).
parent(helen, patricia).
parent(robert, peter).
parent(helen, peter).
parent(robert, linda).
parent(helen, linda).

% Generation 2: Parents (producing children)
parent(thomas, mark).
parent(patricia, mark).
parent(thomas, emma).
parent(patricia, emma).

parent(george, johnny).
parent(susan, johnny).

parent(peter, sophia).
parent(linda, sophia).

% BASIC RELATIONSHIP RULES

% Father: male parent
father(Father, Child) :- 
    male(Father), 
    parent(Father, Child).

% Mother: female parent
mother(Mother, Child) :- 
    female(Mother), 
    parent(Mother, Child).

% Child: inverse of parent
child(Child, Parent) :- 
    parent(Parent, Child).

% Sibling: share at least one parent
sibling(X, Y) :- 
    parent(P, X), 
    parent(P, Y), 
    X \= Y.

% Brother: male sibling
brother(Brother, Person) :- 
    male(Brother), 
    sibling(Brother, Person).

% Sister: female sibling
sister(Sister, Person) :- 
    female(Sister), 
    sibling(Sister, Person).

% EXTENDED RELATIONSHIP RULES

% Grandparent: parent of one's parent
grandparent(GP, Grandchild) :- 
    parent(GP, X), 
    parent(X, Grandchild).

% Grandchild: inverse of grandparent
grandchild(Child, Grandparent) :- 
    grandparent(Grandparent, Child).

% Uncle: brother of one's parent
uncle(Uncle, Person) :- 
    male(Uncle),
    parent(Parent, Person),
    sibling(Uncle, Parent).

% Aunt: sister of one's parent
aunt(Aunt, Person) :-
    female(Aunt),
    parent(Parent, Person),
    sibling(Aunt, Parent).

% Cousin: child of one's parent's sibling (excludes siblings)
cousin(Cousin1, Cousin2) :-
    parent(P1, Cousin1),
    parent(P2, Cousin2),
    sibling(P1, P2),
    Cousin1 \= Cousin2.

% First Cousin: share grandparents but are not siblings
first_cousin(C1, C2) :-
    grandparent(GP, C1),
    grandparent(GP, C2),
    C1 \= C2,
    \+ sibling(C1, C2).

% ANCESTOR/DESCENDANT RULES

% Descendant: direct child or child of descendant
descendant(Descendant, Ancestor) :- 
    parent(Ancestor, Descendant).
descendant(Descendant, Ancestor) :- 
    parent(Ancestor, X), 
    descendant(Descendant, X).

% Ancestor: inverse of descendant
ancestor(Ancestor, Descendant) :- 
    descendant(Descendant, Ancestor).

% INTEGRITY CONSTRAINTS
% Uncomment to enforce constraints:
% :- male(X), female(X).  % No one can be both male and female
