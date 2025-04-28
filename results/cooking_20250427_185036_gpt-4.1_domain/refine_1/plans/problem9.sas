begin_version
3
end_version
begin_metric
0
end_metric
5
begin_variable
var0
-1
3
Atom at(knife1, cutting_board)
Atom holding(robot1, knife1)
Atom in-bowl(knife1)
end_variable
begin_variable
var1
-1
3
Atom at(cucumber2, cutting_board)
Atom holding(robot1, cucumber2)
Atom in-bowl(cucumber2)
end_variable
begin_variable
var2
-1
3
Atom at(cucumber1, cutting_board)
Atom holding(robot1, cucumber1)
Atom in-bowl(cucumber1)
end_variable
begin_variable
var3
-1
3
Atom at(carrot1, cutting_board)
Atom holding(robot1, carrot1)
Atom in-bowl(carrot1)
end_variable
begin_variable
var4
-1
2
Atom sliced(carrot1)
NegatedAtom sliced(carrot1)
end_variable
0
begin_state
0
0
0
0
1
end_state
begin_goal
4
1 2
2 2
3 2
4 0
end_goal
13
begin_operator
pick robot1 carrot1 cutting_board
0
1
0 3 0 1
1
end_operator
begin_operator
pick robot1 cucumber1 cutting_board
0
1
0 2 0 1
1
end_operator
begin_operator
pick robot1 cucumber2 cutting_board
0
1
0 1 0 1
1
end_operator
begin_operator
pick robot1 knife1 cutting_board
0
1
0 0 0 1
1
end_operator
begin_operator
place robot1 carrot1 cutting_board
0
1
0 3 1 0
1
end_operator
begin_operator
place robot1 cucumber1 cutting_board
0
1
0 2 1 0
1
end_operator
begin_operator
place robot1 cucumber2 cutting_board
0
1
0 1 1 0
1
end_operator
begin_operator
place robot1 knife1 cutting_board
0
1
0 0 1 0
1
end_operator
begin_operator
place-in-bowl robot1 carrot1 bowl1
0
1
0 3 1 2
1
end_operator
begin_operator
place-in-bowl robot1 cucumber1 bowl1
0
1
0 2 1 2
1
end_operator
begin_operator
place-in-bowl robot1 cucumber2 bowl1
0
1
0 1 1 2
1
end_operator
begin_operator
place-in-bowl robot1 knife1 bowl1
0
1
0 0 1 2
1
end_operator
begin_operator
slice robot1 carrot1 knife1 cutting_board
2
3 0
0 1
1
0 4 1 0
1
end_operator
0
