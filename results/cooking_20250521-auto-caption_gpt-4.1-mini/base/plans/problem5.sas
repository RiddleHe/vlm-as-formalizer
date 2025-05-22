begin_version
3
end_version
begin_metric
0
end_metric
10
begin_variable
var0
-1
3
Atom at(knife, bowl)
Atom at(knife, cutting_board)
<none of those>
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
4
Atom carry(robot1, cucumber)
Atom carry(robot1, knife)
Atom carry(robot1, tomato)
Atom free(robot1)
end_variable
begin_variable
var3
-1
4
Atom carry(robot2, cucumber)
Atom carry(robot2, knife)
Atom carry(robot2, tomato)
Atom free(robot2)
end_variable
begin_variable
var4
-1
2
Atom available(cucumber)
NegatedAtom available(cucumber)
end_variable
begin_variable
var5
-1
2
Atom available(tomato)
NegatedAtom available(tomato)
end_variable
begin_variable
var6
-1
3
Atom at(cucumber, bowl)
Atom at(cucumber, cutting_board)
<none of those>
end_variable
begin_variable
var7
-1
3
Atom at(tomato, bowl)
Atom at(tomato, cutting_board)
<none of those>
end_variable
begin_variable
var8
-1
2
Atom is-sliced(cucumber)
Atom is-whole(cucumber)
end_variable
begin_variable
var9
-1
2
Atom is-sliced(tomato)
Atom is-whole(tomato)
end_variable
6
begin_mutex_group
4
6 0
6 1
2 0
3 0
end_mutex_group
begin_mutex_group
4
0 0
0 1
2 1
3 1
end_mutex_group
begin_mutex_group
4
7 0
7 1
2 2
3 2
end_mutex_group
begin_mutex_group
3
4 0
2 0
3 0
end_mutex_group
begin_mutex_group
3
1 0
2 1
3 1
end_mutex_group
begin_mutex_group
3
5 0
2 2
3 2
end_mutex_group
begin_state
2
1
3
1
0
0
1
1
1
1
end_state
begin_goal
4
6 0
7 0
8 0
9 0
end_goal
40
begin_operator
pick robot1 cucumber bowl
0
3
0 6 0 2
0 4 0 1
0 2 3 0
1
end_operator
begin_operator
pick robot1 cucumber cutting_board
0
3
0 6 1 2
0 4 0 1
0 2 3 0
1
end_operator
begin_operator
pick robot1 knife bowl
0
3
0 0 0 2
0 1 0 1
0 2 3 1
1
end_operator
begin_operator
pick robot1 knife cutting_board
0
3
0 0 1 2
0 1 0 1
0 2 3 1
1
end_operator
begin_operator
pick robot1 tomato bowl
0
3
0 7 0 2
0 5 0 1
0 2 3 2
1
end_operator
begin_operator
pick robot1 tomato cutting_board
0
3
0 7 1 2
0 5 0 1
0 2 3 2
1
end_operator
begin_operator
pick robot2 cucumber bowl
0
3
0 6 0 2
0 4 0 1
0 3 3 0
1
end_operator
begin_operator
pick robot2 cucumber cutting_board
0
3
0 6 1 2
0 4 0 1
0 3 3 0
1
end_operator
begin_operator
pick robot2 knife bowl
0
3
0 0 0 2
0 1 0 1
0 3 3 1
1
end_operator
begin_operator
pick robot2 knife cutting_board
0
3
0 0 1 2
0 1 0 1
0 3 3 1
1
end_operator
begin_operator
pick robot2 tomato bowl
0
3
0 7 0 2
0 5 0 1
0 3 3 2
1
end_operator
begin_operator
pick robot2 tomato cutting_board
0
3
0 7 1 2
0 5 0 1
0 3 3 2
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 6 1 0
0 4 -1 0
0 2 0 3
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 6 2 0
0 4 -1 0
0 2 0 3
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 6 0 1
0 4 -1 0
0 2 0 3
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 6 2 1
0 4 -1 0
0 2 0 3
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 0 1 0
0 1 -1 0
0 2 1 3
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 0 2 0
0 1 -1 0
0 2 1 3
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 0 0 1
0 1 -1 0
0 2 1 3
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 0 2 1
0 1 -1 0
0 2 1 3
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 7 1 0
0 5 -1 0
0 2 2 3
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 7 2 0
0 5 -1 0
0 2 2 3
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 7 0 1
0 5 -1 0
0 2 2 3
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 7 2 1
0 5 -1 0
0 2 2 3
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 6 1 0
0 4 -1 0
0 3 0 3
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 6 2 0
0 4 -1 0
0 3 0 3
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 6 0 1
0 4 -1 0
0 3 0 3
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 6 2 1
0 4 -1 0
0 3 0 3
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 0 1 0
0 1 -1 0
0 3 1 3
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 0 2 0
0 1 -1 0
0 3 1 3
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 0 0 1
0 1 -1 0
0 3 1 3
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 0 2 1
0 1 -1 0
0 3 1 3
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 7 1 0
0 5 -1 0
0 3 2 3
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 7 2 0
0 5 -1 0
0 3 2 3
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 7 0 1
0 5 -1 0
0 3 2 3
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 7 2 1
0 5 -1 0
0 3 2 3
1
end_operator
begin_operator
slice robot1 cucumber knife cutting_board
2
6 1
2 1
1
0 8 1 0
1
end_operator
begin_operator
slice robot1 tomato knife cutting_board
2
7 1
2 1
1
0 9 1 0
1
end_operator
begin_operator
slice robot2 cucumber knife cutting_board
2
6 1
3 1
1
0 8 1 0
1
end_operator
begin_operator
slice robot2 tomato knife cutting_board
2
7 1
3 1
1
0 9 1 0
1
end_operator
0
