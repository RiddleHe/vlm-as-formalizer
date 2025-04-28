begin_version
3
end_version
begin_metric
0
end_metric
3
begin_variable
var0
-1
3
Atom at(tomato, bowl)
Atom at(tomato, cutting_board)
Atom holding(robot1, tomato)
end_variable
begin_variable
var1
-1
3
Atom at(cucumber, bowl)
Atom at(cucumber, cutting_board)
Atom holding(robot1, cucumber)
end_variable
begin_variable
var2
-1
2
Atom sliced(cucumber)
NegatedAtom sliced(cucumber)
end_variable
0
begin_state
1
1
1
end_state
begin_goal
3
0 0
1 0
2 0
end_goal
10
begin_operator
pick robot1 cucumber bowl
0
1
0 1 0 2
1
end_operator
begin_operator
pick robot1 cucumber cutting_board
0
1
0 1 1 2
1
end_operator
begin_operator
pick robot1 tomato bowl
0
1
0 0 0 2
1
end_operator
begin_operator
pick robot1 tomato cutting_board
0
1
0 0 1 2
1
end_operator
begin_operator
place robot1 cucumber bowl
0
1
0 1 2 0
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
1
0 1 2 1
1
end_operator
begin_operator
place robot1 tomato bowl
0
1
0 0 2 0
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
1
0 0 2 1
1
end_operator
begin_operator
slice robot1 cucumber knife bowl
1
1 2
1
0 2 -1 0
1
end_operator
begin_operator
slice robot1 cucumber knife cutting_board
1
1 2
1
0 2 -1 0
1
end_operator
0
