begin_version
3
end_version
begin_metric
0
end_metric
6
begin_variable
var0
-1
4
Atom at(knife, bowl)
Atom at(knife, counter)
Atom at(knife, cutting_board)
Atom carry(robot1, knife)
end_variable
begin_variable
var1
-1
2
Atom available(knife)
NegatedAtom available(knife)
end_variable
begin_variable
var2
-1
2
Atom free(robot1)
NegatedAtom free(robot1)
end_variable
begin_variable
var3
-1
2
Atom available(cucumber)
NegatedAtom available(cucumber)
end_variable
begin_variable
var4
-1
4
Atom at(cucumber, bowl)
Atom at(cucumber, counter)
Atom at(cucumber, cutting_board)
Atom carry(robot1, cucumber)
end_variable
begin_variable
var5
-1
2
Atom is-sliced(cucumber)
Atom is-whole(cucumber)
end_variable
3
begin_mutex_group
2
4 3
3 0
end_mutex_group
begin_mutex_group
2
0 3
1 0
end_mutex_group
begin_mutex_group
3
4 3
0 3
2 0
end_mutex_group
begin_state
1
0
0
0
2
1
end_state
begin_goal
2
4 0
5 0
end_goal
13
begin_operator
pick robot1 cucumber bowl
0
3
0 4 0 3
0 3 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 cucumber counter
0
3
0 4 1 3
0 3 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 cucumber cutting_board
0
3
0 4 2 3
0 3 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 knife bowl
0
3
0 0 0 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 knife counter
0
3
0 0 1 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 knife cutting_board
0
3
0 0 2 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 4 3 0
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 4 3 1
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 4 3 2
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 0 3 0
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 0 3 1
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 0 3 2
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
slice robot1 cucumber knife cutting_board
2
4 2
0 3
1
0 5 1 0
1
end_operator
0
