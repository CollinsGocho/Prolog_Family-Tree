# Prolog Family Tree

A comprehensive Prolog-based family tree system demonstrating relationship rules including grandparents, parents, children, grandchildren, cousins, uncles, and aunts.

## Quick Start

bash
# Install SWI-Prolog
sudo apt-get install swi-prolog  # Linux
brew install swi-prolog           # macOS

# Run Prolog
swipl

# Load the file
consult('family.pl').

## Core Facts
Gender
prolog
male(james).      % Grandfather
male(thomas).     % Father
female(mary).     % Grandmother
female(patricia). % Mother
Parent Relationships (3 generations)
prolog
% Generation 1 → 2 (Grandparents to Parents)
parent(james, thomas).
parent(mary, thomas).

% Generation 2 → 3 (Parents to Children)
parent(thomas, mark).
parent(patricia, mark).
Key Rules
Rule	Definition
father(F, C)	Male parent of child
mother(M, C)	Female parent of child
grandparent(GP, GC)	Parent of parent
sibling(X, Y)	Share a parent
uncle(U, P)	Brother of P's parent
aunt(A, P)	Sister of P's parent
cousin(C1, C2)	Children of siblings
descendant(D, A)	Child or grandchild of A
Example Queries
prolog
% Find grandparents of Mark
?- grandparent(GP, mark).
GP = james ;
GP = mary .

% Find uncles of Mark
?- uncle(Uncle, mark).
Uncle = george ;
Uncle = peter .

% Find all descendants of James
?- descendant(james, X).
X = thomas ;
X = george ;
X = mark ;
X = emma .
Family Structure
text
Grandparents: James & Mary, Robert & Helen
     ↓
Parents: Thomas, George, Susan, Patricia, Peter, Linda
     ↓
Children: Mark, Emma, Johnny, Sophia
Relationship Rules Explained
Uncle/Aunt: Siblings of your parent

Cousin: Children of your parent's siblings

First cousin: Share common grandparents

Descendant: Any child/grandchild down the line

Ancestor: Any parent/grandparent up the line

Load and Test
prolog
?- [family].              % Load file
?- listing(male).         % List all male facts
?- sibling(thomas, X).    % Find Thomas's siblings
?- cousin(mark, Johnny).  % Check if cousins
