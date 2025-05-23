begin_version
3
end_version
begin_metric
0
end_metric
15
begin_variable
var0
-1
4
Atom at(bowl, bowl)
Atom at(bowl, counter)
Atom at(bowl, cutting_board)
<none of those>
end_variable
begin_variable
var1
-1
2
Atom available(bowl)
NegatedAtom available(bowl)
end_variable
begin_variable
var2
-1
4
Atom at(counter, bowl)
Atom at(counter, counter)
Atom at(counter, cutting_board)
<none of those>
end_variable
begin_variable
var3
-1
2
Atom available(counter)
NegatedAtom available(counter)
end_variable
begin_variable
var4
-1
4
Atom at(cutting_board, bowl)
Atom at(cutting_board, counter)
Atom at(cutting_board, cutting_board)
<none of those>
end_variable
begin_variable
var5
-1
2
Atom available(cutting_board)
NegatedAtom available(cutting_board)
end_variable
begin_variable
var6
-1
4
Atom at(knife, bowl)
Atom at(knife, counter)
Atom at(knife, cutting_board)
<none of those>
end_variable
begin_variable
var7
-1
2
Atom available(knife)
NegatedAtom available(knife)
end_variable
begin_variable
var8
-1
7
Atom carry(robot1, bowl)
Atom carry(robot1, counter)
Atom carry(robot1, cucumber)
Atom carry(robot1, cutting_board)
Atom carry(robot1, knife)
Atom carry(robot1, tomato)
Atom free(robot1)
end_variable
begin_variable
var9
-1
7
Atom carry(robot2, bowl)
Atom carry(robot2, counter)
Atom carry(robot2, cucumber)
Atom carry(robot2, cutting_board)
Atom carry(robot2, knife)
Atom carry(robot2, tomato)
Atom free(robot2)
end_variable
begin_variable
var10
-1
2
Atom available(cucumber)
NegatedAtom available(cucumber)
end_variable
begin_variable
var11
-1
2
Atom available(tomato)
NegatedAtom available(tomato)
end_variable
begin_variable
var12
-1
4
Atom at(cucumber, bowl)
Atom at(cucumber, counter)
Atom at(cucumber, cutting_board)
<none of those>
end_variable
begin_variable
var13
-1
4
Atom at(tomato, bowl)
Atom at(tomato, counter)
Atom at(tomato, cutting_board)
<none of those>
end_variable
begin_variable
var14
-1
2
Atom is-sliced(cucumber)
Atom is-whole(cucumber)
end_variable
12
begin_mutex_group
5
0 0
0 1
0 2
8 0
9 0
end_mutex_group
begin_mutex_group
5
2 0
2 1
2 2
8 1
9 1
end_mutex_group
begin_mutex_group
5
12 0
12 1
12 2
8 2
9 2
end_mutex_group
begin_mutex_group
5
4 0
4 1
4 2
8 3
9 3
end_mutex_group
begin_mutex_group
5
6 0
6 1
6 2
8 4
9 4
end_mutex_group
begin_mutex_group
5
13 0
13 1
13 2
8 5
9 5
end_mutex_group
begin_mutex_group
3
1 0
8 0
9 0
end_mutex_group
begin_mutex_group
3
3 0
8 1
9 1
end_mutex_group
begin_mutex_group
3
10 0
8 2
9 2
end_mutex_group
begin_mutex_group
3
5 0
8 3
9 3
end_mutex_group
begin_mutex_group
3
7 0
8 4
9 4
end_mutex_group
begin_mutex_group
3
11 0
8 5
9 5
end_mutex_group
begin_state
1
0
1
0
2
0
3
1
6
4
0
0
1
2
1
end_state
begin_goal
3
12 0
13 0
14 0
end_goal
146
begin_operator
pick robot1 bowl bowl
0
3
0 0 0 3
0 1 0 1
0 8 6 0
1
end_operator
begin_operator
pick robot1 bowl counter
0
3
0 0 1 3
0 1 0 1
0 8 6 0
1
end_operator
begin_operator
pick robot1 bowl cutting_board
0
3
0 0 2 3
0 1 0 1
0 8 6 0
1
end_operator
begin_operator
pick robot1 counter bowl
0
3
0 2 0 3
0 3 0 1
0 8 6 1
1
end_operator
begin_operator
pick robot1 counter counter
0
3
0 2 1 3
0 3 0 1
0 8 6 1
1
end_operator
begin_operator
pick robot1 counter cutting_board
0
3
0 2 2 3
0 3 0 1
0 8 6 1
1
end_operator
begin_operator
pick robot1 cucumber bowl
0
3
0 12 0 3
0 10 0 1
0 8 6 2
1
end_operator
begin_operator
pick robot1 cucumber counter
0
3
0 12 1 3
0 10 0 1
0 8 6 2
1
end_operator
begin_operator
pick robot1 cucumber cutting_board
0
3
0 12 2 3
0 10 0 1
0 8 6 2
1
end_operator
begin_operator
pick robot1 cutting_board bowl
0
3
0 4 0 3
0 5 0 1
0 8 6 3
1
end_operator
begin_operator
pick robot1 cutting_board counter
0
3
0 4 1 3
0 5 0 1
0 8 6 3
1
end_operator
begin_operator
pick robot1 cutting_board cutting_board
0
3
0 4 2 3
0 5 0 1
0 8 6 3
1
end_operator
begin_operator
pick robot1 knife bowl
0
3
0 6 0 3
0 7 0 1
0 8 6 4
1
end_operator
begin_operator
pick robot1 knife counter
0
3
0 6 1 3
0 7 0 1
0 8 6 4
1
end_operator
begin_operator
pick robot1 knife cutting_board
0
3
0 6 2 3
0 7 0 1
0 8 6 4
1
end_operator
begin_operator
pick robot1 tomato bowl
0
3
0 13 0 3
0 11 0 1
0 8 6 5
1
end_operator
begin_operator
pick robot1 tomato counter
0
3
0 13 1 3
0 11 0 1
0 8 6 5
1
end_operator
begin_operator
pick robot1 tomato cutting_board
0
3
0 13 2 3
0 11 0 1
0 8 6 5
1
end_operator
begin_operator
pick robot2 bowl bowl
0
3
0 0 0 3
0 1 0 1
0 9 6 0
1
end_operator
begin_operator
pick robot2 bowl counter
0
3
0 0 1 3
0 1 0 1
0 9 6 0
1
end_operator
begin_operator
pick robot2 bowl cutting_board
0
3
0 0 2 3
0 1 0 1
0 9 6 0
1
end_operator
begin_operator
pick robot2 counter bowl
0
3
0 2 0 3
0 3 0 1
0 9 6 1
1
end_operator
begin_operator
pick robot2 counter counter
0
3
0 2 1 3
0 3 0 1
0 9 6 1
1
end_operator
begin_operator
pick robot2 counter cutting_board
0
3
0 2 2 3
0 3 0 1
0 9 6 1
1
end_operator
begin_operator
pick robot2 cucumber bowl
0
3
0 12 0 3
0 10 0 1
0 9 6 2
1
end_operator
begin_operator
pick robot2 cucumber counter
0
3
0 12 1 3
0 10 0 1
0 9 6 2
1
end_operator
begin_operator
pick robot2 cucumber cutting_board
0
3
0 12 2 3
0 10 0 1
0 9 6 2
1
end_operator
begin_operator
pick robot2 cutting_board bowl
0
3
0 4 0 3
0 5 0 1
0 9 6 3
1
end_operator
begin_operator
pick robot2 cutting_board counter
0
3
0 4 1 3
0 5 0 1
0 9 6 3
1
end_operator
begin_operator
pick robot2 cutting_board cutting_board
0
3
0 4 2 3
0 5 0 1
0 9 6 3
1
end_operator
begin_operator
pick robot2 knife bowl
0
3
0 6 0 3
0 7 0 1
0 9 6 4
1
end_operator
begin_operator
pick robot2 knife counter
0
3
0 6 1 3
0 7 0 1
0 9 6 4
1
end_operator
begin_operator
pick robot2 knife cutting_board
0
3
0 6 2 3
0 7 0 1
0 9 6 4
1
end_operator
begin_operator
pick robot2 tomato bowl
0
3
0 13 0 3
0 11 0 1
0 9 6 5
1
end_operator
begin_operator
pick robot2 tomato counter
0
3
0 13 1 3
0 11 0 1
0 9 6 5
1
end_operator
begin_operator
pick robot2 tomato cutting_board
0
3
0 13 2 3
0 11 0 1
0 9 6 5
1
end_operator
begin_operator
place robot1 bowl bowl
0
3
0 0 1 0
0 1 -1 0
0 8 0 6
1
end_operator
begin_operator
place robot1 bowl bowl
0
3
0 0 2 0
0 1 -1 0
0 8 0 6
1
end_operator
begin_operator
place robot1 bowl bowl
0
3
0 0 3 0
0 1 -1 0
0 8 0 6
1
end_operator
begin_operator
place robot1 bowl counter
0
3
0 0 0 1
0 1 -1 0
0 8 0 6
1
end_operator
begin_operator
place robot1 bowl counter
0
3
0 0 2 1
0 1 -1 0
0 8 0 6
1
end_operator
begin_operator
place robot1 bowl counter
0
3
0 0 3 1
0 1 -1 0
0 8 0 6
1
end_operator
begin_operator
place robot1 bowl cutting_board
0
3
0 0 0 2
0 1 -1 0
0 8 0 6
1
end_operator
begin_operator
place robot1 bowl cutting_board
0
3
0 0 1 2
0 1 -1 0
0 8 0 6
1
end_operator
begin_operator
place robot1 bowl cutting_board
0
3
0 0 3 2
0 1 -1 0
0 8 0 6
1
end_operator
begin_operator
place robot1 counter bowl
0
3
0 2 1 0
0 3 -1 0
0 8 1 6
1
end_operator
begin_operator
place robot1 counter bowl
0
3
0 2 2 0
0 3 -1 0
0 8 1 6
1
end_operator
begin_operator
place robot1 counter bowl
0
3
0 2 3 0
0 3 -1 0
0 8 1 6
1
end_operator
begin_operator
place robot1 counter counter
0
3
0 2 0 1
0 3 -1 0
0 8 1 6
1
end_operator
begin_operator
place robot1 counter counter
0
3
0 2 2 1
0 3 -1 0
0 8 1 6
1
end_operator
begin_operator
place robot1 counter counter
0
3
0 2 3 1
0 3 -1 0
0 8 1 6
1
end_operator
begin_operator
place robot1 counter cutting_board
0
3
0 2 0 2
0 3 -1 0
0 8 1 6
1
end_operator
begin_operator
place robot1 counter cutting_board
0
3
0 2 1 2
0 3 -1 0
0 8 1 6
1
end_operator
begin_operator
place robot1 counter cutting_board
0
3
0 2 3 2
0 3 -1 0
0 8 1 6
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 12 1 0
0 10 -1 0
0 8 2 6
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 12 2 0
0 10 -1 0
0 8 2 6
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 12 3 0
0 10 -1 0
0 8 2 6
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 12 0 1
0 10 -1 0
0 8 2 6
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 12 2 1
0 10 -1 0
0 8 2 6
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 12 3 1
0 10 -1 0
0 8 2 6
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 12 0 2
0 10 -1 0
0 8 2 6
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 12 1 2
0 10 -1 0
0 8 2 6
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 12 3 2
0 10 -1 0
0 8 2 6
1
end_operator
begin_operator
place robot1 cutting_board bowl
0
3
0 4 1 0
0 5 -1 0
0 8 3 6
1
end_operator
begin_operator
place robot1 cutting_board bowl
0
3
0 4 2 0
0 5 -1 0
0 8 3 6
1
end_operator
begin_operator
place robot1 cutting_board bowl
0
3
0 4 3 0
0 5 -1 0
0 8 3 6
1
end_operator
begin_operator
place robot1 cutting_board counter
0
3
0 4 0 1
0 5 -1 0
0 8 3 6
1
end_operator
begin_operator
place robot1 cutting_board counter
0
3
0 4 2 1
0 5 -1 0
0 8 3 6
1
end_operator
begin_operator
place robot1 cutting_board counter
0
3
0 4 3 1
0 5 -1 0
0 8 3 6
1
end_operator
begin_operator
place robot1 cutting_board cutting_board
0
3
0 4 0 2
0 5 -1 0
0 8 3 6
1
end_operator
begin_operator
place robot1 cutting_board cutting_board
0
3
0 4 1 2
0 5 -1 0
0 8 3 6
1
end_operator
begin_operator
place robot1 cutting_board cutting_board
0
3
0 4 3 2
0 5 -1 0
0 8 3 6
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 6 1 0
0 7 -1 0
0 8 4 6
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 6 2 0
0 7 -1 0
0 8 4 6
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 6 3 0
0 7 -1 0
0 8 4 6
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 6 0 1
0 7 -1 0
0 8 4 6
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 6 2 1
0 7 -1 0
0 8 4 6
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 6 3 1
0 7 -1 0
0 8 4 6
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 6 0 2
0 7 -1 0
0 8 4 6
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 6 1 2
0 7 -1 0
0 8 4 6
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 6 3 2
0 7 -1 0
0 8 4 6
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 13 1 0
0 11 -1 0
0 8 5 6
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 13 2 0
0 11 -1 0
0 8 5 6
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 13 3 0
0 11 -1 0
0 8 5 6
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 13 0 1
0 11 -1 0
0 8 5 6
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 13 2 1
0 11 -1 0
0 8 5 6
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 13 3 1
0 11 -1 0
0 8 5 6
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 13 0 2
0 11 -1 0
0 8 5 6
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 13 1 2
0 11 -1 0
0 8 5 6
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 13 3 2
0 11 -1 0
0 8 5 6
1
end_operator
begin_operator
place robot2 bowl bowl
0
3
0 0 1 0
0 1 -1 0
0 9 0 6
1
end_operator
begin_operator
place robot2 bowl bowl
0
3
0 0 2 0
0 1 -1 0
0 9 0 6
1
end_operator
begin_operator
place robot2 bowl bowl
0
3
0 0 3 0
0 1 -1 0
0 9 0 6
1
end_operator
begin_operator
place robot2 bowl counter
0
3
0 0 0 1
0 1 -1 0
0 9 0 6
1
end_operator
begin_operator
place robot2 bowl counter
0
3
0 0 2 1
0 1 -1 0
0 9 0 6
1
end_operator
begin_operator
place robot2 bowl counter
0
3
0 0 3 1
0 1 -1 0
0 9 0 6
1
end_operator
begin_operator
place robot2 bowl cutting_board
0
3
0 0 0 2
0 1 -1 0
0 9 0 6
1
end_operator
begin_operator
place robot2 bowl cutting_board
0
3
0 0 1 2
0 1 -1 0
0 9 0 6
1
end_operator
begin_operator
place robot2 bowl cutting_board
0
3
0 0 3 2
0 1 -1 0
0 9 0 6
1
end_operator
begin_operator
place robot2 counter bowl
0
3
0 2 1 0
0 3 -1 0
0 9 1 6
1
end_operator
begin_operator
place robot2 counter bowl
0
3
0 2 2 0
0 3 -1 0
0 9 1 6
1
end_operator
begin_operator
place robot2 counter bowl
0
3
0 2 3 0
0 3 -1 0
0 9 1 6
1
end_operator
begin_operator
place robot2 counter counter
0
3
0 2 0 1
0 3 -1 0
0 9 1 6
1
end_operator
begin_operator
place robot2 counter counter
0
3
0 2 2 1
0 3 -1 0
0 9 1 6
1
end_operator
begin_operator
place robot2 counter counter
0
3
0 2 3 1
0 3 -1 0
0 9 1 6
1
end_operator
begin_operator
place robot2 counter cutting_board
0
3
0 2 0 2
0 3 -1 0
0 9 1 6
1
end_operator
begin_operator
place robot2 counter cutting_board
0
3
0 2 1 2
0 3 -1 0
0 9 1 6
1
end_operator
begin_operator
place robot2 counter cutting_board
0
3
0 2 3 2
0 3 -1 0
0 9 1 6
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 12 1 0
0 10 -1 0
0 9 2 6
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 12 2 0
0 10 -1 0
0 9 2 6
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 12 3 0
0 10 -1 0
0 9 2 6
1
end_operator
begin_operator
place robot2 cucumber counter
0
3
0 12 0 1
0 10 -1 0
0 9 2 6
1
end_operator
begin_operator
place robot2 cucumber counter
0
3
0 12 2 1
0 10 -1 0
0 9 2 6
1
end_operator
begin_operator
place robot2 cucumber counter
0
3
0 12 3 1
0 10 -1 0
0 9 2 6
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 12 0 2
0 10 -1 0
0 9 2 6
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 12 1 2
0 10 -1 0
0 9 2 6
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 12 3 2
0 10 -1 0
0 9 2 6
1
end_operator
begin_operator
place robot2 cutting_board bowl
0
3
0 4 1 0
0 5 -1 0
0 9 3 6
1
end_operator
begin_operator
place robot2 cutting_board bowl
0
3
0 4 2 0
0 5 -1 0
0 9 3 6
1
end_operator
begin_operator
place robot2 cutting_board bowl
0
3
0 4 3 0
0 5 -1 0
0 9 3 6
1
end_operator
begin_operator
place robot2 cutting_board counter
0
3
0 4 0 1
0 5 -1 0
0 9 3 6
1
end_operator
begin_operator
place robot2 cutting_board counter
0
3
0 4 2 1
0 5 -1 0
0 9 3 6
1
end_operator
begin_operator
place robot2 cutting_board counter
0
3
0 4 3 1
0 5 -1 0
0 9 3 6
1
end_operator
begin_operator
place robot2 cutting_board cutting_board
0
3
0 4 0 2
0 5 -1 0
0 9 3 6
1
end_operator
begin_operator
place robot2 cutting_board cutting_board
0
3
0 4 1 2
0 5 -1 0
0 9 3 6
1
end_operator
begin_operator
place robot2 cutting_board cutting_board
0
3
0 4 3 2
0 5 -1 0
0 9 3 6
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 6 1 0
0 7 -1 0
0 9 4 6
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 6 2 0
0 7 -1 0
0 9 4 6
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 6 3 0
0 7 -1 0
0 9 4 6
1
end_operator
begin_operator
place robot2 knife counter
0
3
0 6 0 1
0 7 -1 0
0 9 4 6
1
end_operator
begin_operator
place robot2 knife counter
0
3
0 6 2 1
0 7 -1 0
0 9 4 6
1
end_operator
begin_operator
place robot2 knife counter
0
3
0 6 3 1
0 7 -1 0
0 9 4 6
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 6 0 2
0 7 -1 0
0 9 4 6
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 6 1 2
0 7 -1 0
0 9 4 6
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 6 3 2
0 7 -1 0
0 9 4 6
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 13 1 0
0 11 -1 0
0 9 5 6
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 13 2 0
0 11 -1 0
0 9 5 6
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 13 3 0
0 11 -1 0
0 9 5 6
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 13 0 1
0 11 -1 0
0 9 5 6
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 13 2 1
0 11 -1 0
0 9 5 6
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 13 3 1
0 11 -1 0
0 9 5 6
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 13 0 2
0 11 -1 0
0 9 5 6
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 13 1 2
0 11 -1 0
0 9 5 6
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 13 3 2
0 11 -1 0
0 9 5 6
1
end_operator
begin_operator
slice robot1 cucumber knife cutting_board
2
12 2
8 4
1
0 14 1 0
1
end_operator
begin_operator
slice robot2 cucumber knife cutting_board
2
12 2
9 4
1
0 14 1 0
1
end_operator
0
