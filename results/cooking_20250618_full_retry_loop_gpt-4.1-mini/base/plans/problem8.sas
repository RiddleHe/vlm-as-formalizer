begin_version
3
end_version
begin_metric
0
end_metric
11
begin_variable
var0
-1
4
Atom at(dressing, bowl)
Atom at(dressing, counter)
Atom at(dressing, cutting_board)
<none of those>
end_variable
begin_variable
var1
-1
2
Atom available(dressing)
NegatedAtom available(dressing)
end_variable
begin_variable
var2
-1
4
Atom at(knife, bowl)
Atom at(knife, counter)
Atom at(knife, cutting_board)
<none of those>
end_variable
begin_variable
var3
-1
2
Atom available(knife)
NegatedAtom available(knife)
end_variable
begin_variable
var4
-1
5
Atom carry(robot1, cucumber)
Atom carry(robot1, dressing)
Atom carry(robot1, knife)
Atom carry(robot1, tomato)
Atom free(robot1)
end_variable
begin_variable
var5
-1
5
Atom carry(robot2, cucumber)
Atom carry(robot2, dressing)
Atom carry(robot2, knife)
Atom carry(robot2, tomato)
Atom free(robot2)
end_variable
begin_variable
var6
-1
2
Atom available(cucumber)
NegatedAtom available(cucumber)
end_variable
begin_variable
var7
-1
2
Atom available(tomato)
NegatedAtom available(tomato)
end_variable
begin_variable
var8
-1
4
Atom at(cucumber, bowl)
Atom at(cucumber, counter)
Atom at(cucumber, cutting_board)
<none of those>
end_variable
begin_variable
var9
-1
4
Atom at(tomato, bowl)
Atom at(tomato, counter)
Atom at(tomato, cutting_board)
<none of those>
end_variable
begin_variable
var10
-1
2
Atom is-sliced(cucumber)
Atom is-whole(cucumber)
end_variable
8
begin_mutex_group
5
8 0
8 1
8 2
4 0
5 0
end_mutex_group
begin_mutex_group
5
0 0
0 1
0 2
4 1
5 1
end_mutex_group
begin_mutex_group
5
2 0
2 1
2 2
4 2
5 2
end_mutex_group
begin_mutex_group
5
9 0
9 1
9 2
4 3
5 3
end_mutex_group
begin_mutex_group
3
6 0
4 0
5 0
end_mutex_group
begin_mutex_group
3
1 0
4 1
5 1
end_mutex_group
begin_mutex_group
3
3 0
4 2
5 2
end_mutex_group
begin_mutex_group
3
7 0
4 3
5 3
end_mutex_group
begin_state
1
0
3
1
4
2
0
0
1
1
1
end_state
begin_goal
3
8 0
9 0
10 0
end_goal
98
begin_operator
pick robot1 cucumber bowl
0
3
0 8 0 3
0 6 0 1
0 4 4 0
1
end_operator
begin_operator
pick robot1 cucumber counter
0
3
0 8 1 3
0 6 0 1
0 4 4 0
1
end_operator
begin_operator
pick robot1 cucumber cutting_board
0
3
0 8 2 3
0 6 0 1
0 4 4 0
1
end_operator
begin_operator
pick robot1 dressing bowl
0
3
0 0 0 3
0 1 0 1
0 4 4 1
1
end_operator
begin_operator
pick robot1 dressing counter
0
3
0 0 1 3
0 1 0 1
0 4 4 1
1
end_operator
begin_operator
pick robot1 dressing cutting_board
0
3
0 0 2 3
0 1 0 1
0 4 4 1
1
end_operator
begin_operator
pick robot1 knife bowl
0
3
0 2 0 3
0 3 0 1
0 4 4 2
1
end_operator
begin_operator
pick robot1 knife counter
0
3
0 2 1 3
0 3 0 1
0 4 4 2
1
end_operator
begin_operator
pick robot1 knife cutting_board
0
3
0 2 2 3
0 3 0 1
0 4 4 2
1
end_operator
begin_operator
pick robot1 tomato bowl
0
3
0 9 0 3
0 7 0 1
0 4 4 3
1
end_operator
begin_operator
pick robot1 tomato counter
0
3
0 9 1 3
0 7 0 1
0 4 4 3
1
end_operator
begin_operator
pick robot1 tomato cutting_board
0
3
0 9 2 3
0 7 0 1
0 4 4 3
1
end_operator
begin_operator
pick robot2 cucumber bowl
0
3
0 8 0 3
0 6 0 1
0 5 4 0
1
end_operator
begin_operator
pick robot2 cucumber counter
0
3
0 8 1 3
0 6 0 1
0 5 4 0
1
end_operator
begin_operator
pick robot2 cucumber cutting_board
0
3
0 8 2 3
0 6 0 1
0 5 4 0
1
end_operator
begin_operator
pick robot2 dressing bowl
0
3
0 0 0 3
0 1 0 1
0 5 4 1
1
end_operator
begin_operator
pick robot2 dressing counter
0
3
0 0 1 3
0 1 0 1
0 5 4 1
1
end_operator
begin_operator
pick robot2 dressing cutting_board
0
3
0 0 2 3
0 1 0 1
0 5 4 1
1
end_operator
begin_operator
pick robot2 knife bowl
0
3
0 2 0 3
0 3 0 1
0 5 4 2
1
end_operator
begin_operator
pick robot2 knife counter
0
3
0 2 1 3
0 3 0 1
0 5 4 2
1
end_operator
begin_operator
pick robot2 knife cutting_board
0
3
0 2 2 3
0 3 0 1
0 5 4 2
1
end_operator
begin_operator
pick robot2 tomato bowl
0
3
0 9 0 3
0 7 0 1
0 5 4 3
1
end_operator
begin_operator
pick robot2 tomato counter
0
3
0 9 1 3
0 7 0 1
0 5 4 3
1
end_operator
begin_operator
pick robot2 tomato cutting_board
0
3
0 9 2 3
0 7 0 1
0 5 4 3
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 8 1 0
0 6 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 8 2 0
0 6 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 8 3 0
0 6 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 8 0 1
0 6 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 8 2 1
0 6 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 8 3 1
0 6 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 8 0 2
0 6 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 8 1 2
0 6 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 8 3 2
0 6 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 dressing bowl
0
3
0 0 1 0
0 1 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 dressing bowl
0
3
0 0 2 0
0 1 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 dressing bowl
0
3
0 0 3 0
0 1 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 dressing counter
0
3
0 0 0 1
0 1 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 dressing counter
0
3
0 0 2 1
0 1 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 dressing counter
0
3
0 0 3 1
0 1 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 dressing cutting_board
0
3
0 0 0 2
0 1 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 dressing cutting_board
0
3
0 0 1 2
0 1 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 dressing cutting_board
0
3
0 0 3 2
0 1 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 2 1 0
0 3 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 2 2 0
0 3 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 2 3 0
0 3 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 2 0 1
0 3 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 2 2 1
0 3 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 2 3 1
0 3 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 2 0 2
0 3 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 2 1 2
0 3 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 2 3 2
0 3 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 9 1 0
0 7 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 9 2 0
0 7 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 9 3 0
0 7 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 9 0 1
0 7 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 9 2 1
0 7 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 9 3 1
0 7 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 9 0 2
0 7 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 9 1 2
0 7 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 9 3 2
0 7 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 8 1 0
0 6 -1 0
0 5 0 4
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 8 2 0
0 6 -1 0
0 5 0 4
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 8 3 0
0 6 -1 0
0 5 0 4
1
end_operator
begin_operator
place robot2 cucumber counter
0
3
0 8 0 1
0 6 -1 0
0 5 0 4
1
end_operator
begin_operator
place robot2 cucumber counter
0
3
0 8 2 1
0 6 -1 0
0 5 0 4
1
end_operator
begin_operator
place robot2 cucumber counter
0
3
0 8 3 1
0 6 -1 0
0 5 0 4
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 8 0 2
0 6 -1 0
0 5 0 4
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 8 1 2
0 6 -1 0
0 5 0 4
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 8 3 2
0 6 -1 0
0 5 0 4
1
end_operator
begin_operator
place robot2 dressing bowl
0
3
0 0 1 0
0 1 -1 0
0 5 1 4
1
end_operator
begin_operator
place robot2 dressing bowl
0
3
0 0 2 0
0 1 -1 0
0 5 1 4
1
end_operator
begin_operator
place robot2 dressing bowl
0
3
0 0 3 0
0 1 -1 0
0 5 1 4
1
end_operator
begin_operator
place robot2 dressing counter
0
3
0 0 0 1
0 1 -1 0
0 5 1 4
1
end_operator
begin_operator
place robot2 dressing counter
0
3
0 0 2 1
0 1 -1 0
0 5 1 4
1
end_operator
begin_operator
place robot2 dressing counter
0
3
0 0 3 1
0 1 -1 0
0 5 1 4
1
end_operator
begin_operator
place robot2 dressing cutting_board
0
3
0 0 0 2
0 1 -1 0
0 5 1 4
1
end_operator
begin_operator
place robot2 dressing cutting_board
0
3
0 0 1 2
0 1 -1 0
0 5 1 4
1
end_operator
begin_operator
place robot2 dressing cutting_board
0
3
0 0 3 2
0 1 -1 0
0 5 1 4
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 2 1 0
0 3 -1 0
0 5 2 4
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 2 2 0
0 3 -1 0
0 5 2 4
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 2 3 0
0 3 -1 0
0 5 2 4
1
end_operator
begin_operator
place robot2 knife counter
0
3
0 2 0 1
0 3 -1 0
0 5 2 4
1
end_operator
begin_operator
place robot2 knife counter
0
3
0 2 2 1
0 3 -1 0
0 5 2 4
1
end_operator
begin_operator
place robot2 knife counter
0
3
0 2 3 1
0 3 -1 0
0 5 2 4
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 2 0 2
0 3 -1 0
0 5 2 4
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 2 1 2
0 3 -1 0
0 5 2 4
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 2 3 2
0 3 -1 0
0 5 2 4
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 9 1 0
0 7 -1 0
0 5 3 4
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 9 2 0
0 7 -1 0
0 5 3 4
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 9 3 0
0 7 -1 0
0 5 3 4
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 9 0 1
0 7 -1 0
0 5 3 4
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 9 2 1
0 7 -1 0
0 5 3 4
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 9 3 1
0 7 -1 0
0 5 3 4
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 9 0 2
0 7 -1 0
0 5 3 4
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 9 1 2
0 7 -1 0
0 5 3 4
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 9 3 2
0 7 -1 0
0 5 3 4
1
end_operator
begin_operator
slice robot1 cucumber knife cutting_board
2
8 2
4 2
1
0 10 1 0
1
end_operator
begin_operator
slice robot2 cucumber knife cutting_board
2
8 2
5 2
1
0 10 1 0
1
end_operator
0
