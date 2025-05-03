begin_version
3
end_version
begin_metric
0
end_metric
9
begin_variable
var0
-1
2
Atom empty(counter)
NegatedAtom empty(counter)
end_variable
begin_variable
var1
-1
2
Atom empty(cutting_board)
NegatedAtom empty(cutting_board)
end_variable
begin_variable
var2
-1
2
Atom at(knife1, counter)
NegatedAtom at(knife1, counter)
end_variable
begin_variable
var3
-1
2
Atom at(knife1, cutting_board)
NegatedAtom at(knife1, cutting_board)
end_variable
begin_variable
var4
-1
3
Atom at(knife1, bowl)
Atom empty(bowl)
<none of those>
end_variable
begin_variable
var5
-1
3
Atom handfree(robot1)
Atom holding(robot1, knife1)
<none of those>
end_variable
begin_variable
var6
-1
3
Atom handfree(robot2)
Atom holding(robot2, knife1)
<none of those>
end_variable
begin_variable
var7
-1
5
Atom at(tomato, bowl)
Atom at(tomato, counter)
Atom at(tomato, cutting_board)
Atom holding(robot1, tomato)
Atom holding(robot2, tomato)
end_variable
begin_variable
var8
-1
2
Atom sliced(tomato)
NegatedAtom sliced(tomato)
end_variable
3
begin_mutex_group
3
4 0
4 1
7 0
end_mutex_group
begin_mutex_group
3
7 3
5 0
5 1
end_mutex_group
begin_mutex_group
3
7 4
6 0
6 1
end_mutex_group
begin_state
0
0
1
0
1
0
1
1
1
end_state
begin_goal
2
7 0
8 0
end_goal
30
begin_operator
pick robot1 knife1 bowl
0
2
0 4 0 2
0 5 0 1
1
end_operator
begin_operator
pick robot1 knife1 counter
0
2
0 2 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot1 knife1 cutting_board
0
2
0 3 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot1 tomato bowl
0
2
0 7 0 3
0 5 0 2
1
end_operator
begin_operator
pick robot1 tomato counter
0
2
0 7 1 3
0 5 0 2
1
end_operator
begin_operator
pick robot1 tomato cutting_board
0
2
0 7 2 3
0 5 0 2
1
end_operator
begin_operator
pick robot2 knife1 bowl
0
2
0 4 0 2
0 6 0 1
1
end_operator
begin_operator
pick robot2 knife1 counter
0
2
0 2 0 1
0 6 0 1
1
end_operator
begin_operator
pick robot2 knife1 cutting_board
0
2
0 3 0 1
0 6 0 1
1
end_operator
begin_operator
pick robot2 tomato bowl
0
2
0 7 0 4
0 6 0 2
1
end_operator
begin_operator
pick robot2 tomato counter
0
2
0 7 1 4
0 6 0 2
1
end_operator
begin_operator
pick robot2 tomato cutting_board
0
2
0 7 2 4
0 6 0 2
1
end_operator
begin_operator
place robot1 knife1 bowl
0
2
0 4 1 0
0 5 1 0
1
end_operator
begin_operator
place robot1 knife1 counter
0
3
0 2 -1 0
0 0 0 1
0 5 1 0
1
end_operator
begin_operator
place robot1 knife1 cutting_board
0
3
0 3 -1 0
0 1 0 1
0 5 1 0
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 4 1 2
0 7 3 0
0 5 -1 0
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 7 3 1
0 0 0 1
0 5 -1 0
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 7 3 2
0 1 0 1
0 5 -1 0
1
end_operator
begin_operator
place robot2 knife1 bowl
0
2
0 4 1 0
0 6 1 0
1
end_operator
begin_operator
place robot2 knife1 counter
0
3
0 2 -1 0
0 0 0 1
0 6 1 0
1
end_operator
begin_operator
place robot2 knife1 cutting_board
0
3
0 3 -1 0
0 1 0 1
0 6 1 0
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 4 1 2
0 7 4 0
0 6 -1 0
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 7 4 1
0 0 0 1
0 6 -1 0
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 7 4 2
0 1 0 1
0 6 -1 0
1
end_operator
begin_operator
slice robot1 tomato knife1 bowl
2
7 0
5 1
1
0 8 1 0
1
end_operator
begin_operator
slice robot1 tomato knife1 counter
2
7 1
5 1
1
0 8 1 0
1
end_operator
begin_operator
slice robot1 tomato knife1 cutting_board
2
7 2
5 1
1
0 8 1 0
1
end_operator
begin_operator
slice robot2 tomato knife1 bowl
2
7 0
6 1
1
0 8 1 0
1
end_operator
begin_operator
slice robot2 tomato knife1 counter
2
7 1
6 1
1
0 8 1 0
1
end_operator
begin_operator
slice robot2 tomato knife1 cutting_board
2
7 2
6 1
1
0 8 1 0
1
end_operator
0
