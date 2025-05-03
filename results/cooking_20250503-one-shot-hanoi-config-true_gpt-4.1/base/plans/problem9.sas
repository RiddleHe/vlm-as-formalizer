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
2
Atom at(knife, bowl)
NegatedAtom at(knife, bowl)
end_variable
begin_variable
var1
-1
2
Atom at(knife, counter)
NegatedAtom at(knife, counter)
end_variable
begin_variable
var2
-1
2
Atom at(knife, cutting_board)
NegatedAtom at(knife, cutting_board)
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
Atom carry(robot1, carrot)
Atom carry(robot1, cucumber1)
Atom carry(robot1, cucumber2)
Atom carry(robot1, knife)
Atom free(robot1)
end_variable
begin_variable
var5
-1
2
Atom available(carrot)
NegatedAtom available(carrot)
end_variable
begin_variable
var6
-1
2
Atom available(cucumber1)
NegatedAtom available(cucumber1)
end_variable
begin_variable
var7
-1
2
Atom available(cucumber2)
NegatedAtom available(cucumber2)
end_variable
begin_variable
var8
-1
5
Atom carry(robot2, carrot)
Atom carry(robot2, cucumber1)
Atom carry(robot2, cucumber2)
Atom carry(robot2, knife)
Atom free(robot2)
end_variable
begin_variable
var9
-1
4
Atom at(carrot, bowl)
Atom at(carrot, counter)
Atom at(carrot, cutting_board)
<none of those>
end_variable
begin_variable
var10
-1
4
Atom at(cucumber1, bowl)
Atom at(cucumber1, counter)
Atom at(cucumber1, cutting_board)
<none of those>
end_variable
begin_variable
var11
-1
4
Atom at(cucumber2, bowl)
Atom at(cucumber2, counter)
Atom at(cucumber2, cutting_board)
<none of those>
end_variable
begin_variable
var12
-1
2
Atom is-sliced(cucumber1)
Atom is-whole(cucumber1)
end_variable
begin_variable
var13
-1
2
Atom is-sliced(carrot)
Atom is-whole(carrot)
end_variable
begin_variable
var14
-1
2
Atom is-sliced(cucumber2)
Atom is-whole(cucumber2)
end_variable
7
begin_mutex_group
5
9 0
9 1
9 2
4 0
8 0
end_mutex_group
begin_mutex_group
5
10 0
10 1
10 2
4 1
8 1
end_mutex_group
begin_mutex_group
5
11 0
11 1
11 2
4 2
8 2
end_mutex_group
begin_mutex_group
3
5 0
4 0
8 0
end_mutex_group
begin_mutex_group
3
6 0
4 1
8 1
end_mutex_group
begin_mutex_group
3
7 0
4 2
8 2
end_mutex_group
begin_mutex_group
3
3 0
4 3
8 3
end_mutex_group
begin_state
1
1
0
1
4
0
0
0
3
1
2
2
1
1
1
end_state
begin_goal
6
9 0
10 0
11 0
12 0
13 0
14 0
end_goal
90
begin_operator
pick robot1 carrot bowl
0
3
0 9 0 3
0 5 0 1
0 4 4 0
1
end_operator
begin_operator
pick robot1 carrot counter
0
3
0 9 1 3
0 5 0 1
0 4 4 0
1
end_operator
begin_operator
pick robot1 carrot cutting_board
0
3
0 9 2 3
0 5 0 1
0 4 4 0
1
end_operator
begin_operator
pick robot1 cucumber1 bowl
0
3
0 10 0 3
0 6 0 1
0 4 4 1
1
end_operator
begin_operator
pick robot1 cucumber1 counter
0
3
0 10 1 3
0 6 0 1
0 4 4 1
1
end_operator
begin_operator
pick robot1 cucumber1 cutting_board
0
3
0 10 2 3
0 6 0 1
0 4 4 1
1
end_operator
begin_operator
pick robot1 cucumber2 bowl
0
3
0 11 0 3
0 7 0 1
0 4 4 2
1
end_operator
begin_operator
pick robot1 cucumber2 counter
0
3
0 11 1 3
0 7 0 1
0 4 4 2
1
end_operator
begin_operator
pick robot1 cucumber2 cutting_board
0
3
0 11 2 3
0 7 0 1
0 4 4 2
1
end_operator
begin_operator
pick robot1 knife bowl
0
3
0 0 0 1
0 3 0 1
0 4 4 3
1
end_operator
begin_operator
pick robot1 knife counter
0
3
0 1 0 1
0 3 0 1
0 4 4 3
1
end_operator
begin_operator
pick robot1 knife cutting_board
0
3
0 2 0 1
0 3 0 1
0 4 4 3
1
end_operator
begin_operator
pick robot2 carrot bowl
0
3
0 9 0 3
0 5 0 1
0 8 4 0
1
end_operator
begin_operator
pick robot2 carrot counter
0
3
0 9 1 3
0 5 0 1
0 8 4 0
1
end_operator
begin_operator
pick robot2 carrot cutting_board
0
3
0 9 2 3
0 5 0 1
0 8 4 0
1
end_operator
begin_operator
pick robot2 cucumber1 bowl
0
3
0 10 0 3
0 6 0 1
0 8 4 1
1
end_operator
begin_operator
pick robot2 cucumber1 counter
0
3
0 10 1 3
0 6 0 1
0 8 4 1
1
end_operator
begin_operator
pick robot2 cucumber1 cutting_board
0
3
0 10 2 3
0 6 0 1
0 8 4 1
1
end_operator
begin_operator
pick robot2 cucumber2 bowl
0
3
0 11 0 3
0 7 0 1
0 8 4 2
1
end_operator
begin_operator
pick robot2 cucumber2 counter
0
3
0 11 1 3
0 7 0 1
0 8 4 2
1
end_operator
begin_operator
pick robot2 cucumber2 cutting_board
0
3
0 11 2 3
0 7 0 1
0 8 4 2
1
end_operator
begin_operator
pick robot2 knife bowl
0
3
0 0 0 1
0 3 0 1
0 8 4 3
1
end_operator
begin_operator
pick robot2 knife counter
0
3
0 1 0 1
0 3 0 1
0 8 4 3
1
end_operator
begin_operator
pick robot2 knife cutting_board
0
3
0 2 0 1
0 3 0 1
0 8 4 3
1
end_operator
begin_operator
place robot1 carrot bowl
0
3
0 9 1 0
0 5 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 carrot bowl
0
3
0 9 2 0
0 5 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 carrot bowl
0
3
0 9 3 0
0 5 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 carrot counter
0
3
0 9 0 1
0 5 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 carrot counter
0
3
0 9 2 1
0 5 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 carrot counter
0
3
0 9 3 1
0 5 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 carrot cutting_board
0
3
0 9 0 2
0 5 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 carrot cutting_board
0
3
0 9 1 2
0 5 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 carrot cutting_board
0
3
0 9 3 2
0 5 -1 0
0 4 0 4
1
end_operator
begin_operator
place robot1 cucumber1 bowl
0
3
0 10 1 0
0 6 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 cucumber1 bowl
0
3
0 10 2 0
0 6 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 cucumber1 bowl
0
3
0 10 3 0
0 6 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 cucumber1 counter
0
3
0 10 0 1
0 6 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 cucumber1 counter
0
3
0 10 2 1
0 6 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 cucumber1 counter
0
3
0 10 3 1
0 6 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 cucumber1 cutting_board
0
3
0 10 0 2
0 6 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 cucumber1 cutting_board
0
3
0 10 1 2
0 6 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 cucumber1 cutting_board
0
3
0 10 3 2
0 6 -1 0
0 4 1 4
1
end_operator
begin_operator
place robot1 cucumber2 bowl
0
3
0 11 1 0
0 7 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 cucumber2 bowl
0
3
0 11 2 0
0 7 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 cucumber2 bowl
0
3
0 11 3 0
0 7 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 cucumber2 counter
0
3
0 11 0 1
0 7 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 cucumber2 counter
0
3
0 11 2 1
0 7 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 cucumber2 counter
0
3
0 11 3 1
0 7 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 cucumber2 cutting_board
0
3
0 11 0 2
0 7 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 cucumber2 cutting_board
0
3
0 11 1 2
0 7 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 cucumber2 cutting_board
0
3
0 11 3 2
0 7 -1 0
0 4 2 4
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 0 1 0
0 3 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 1 1 0
0 3 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 2 1 0
0 3 -1 0
0 4 3 4
1
end_operator
begin_operator
place robot2 carrot bowl
0
3
0 9 1 0
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
place robot2 carrot bowl
0
3
0 9 2 0
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
place robot2 carrot bowl
0
3
0 9 3 0
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
place robot2 carrot counter
0
3
0 9 0 1
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
place robot2 carrot counter
0
3
0 9 2 1
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
place robot2 carrot counter
0
3
0 9 3 1
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
place robot2 carrot cutting_board
0
3
0 9 0 2
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
place robot2 carrot cutting_board
0
3
0 9 1 2
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
place robot2 carrot cutting_board
0
3
0 9 3 2
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
place robot2 cucumber1 bowl
0
3
0 10 1 0
0 6 -1 0
0 8 1 4
1
end_operator
begin_operator
place robot2 cucumber1 bowl
0
3
0 10 2 0
0 6 -1 0
0 8 1 4
1
end_operator
begin_operator
place robot2 cucumber1 bowl
0
3
0 10 3 0
0 6 -1 0
0 8 1 4
1
end_operator
begin_operator
place robot2 cucumber1 counter
0
3
0 10 0 1
0 6 -1 0
0 8 1 4
1
end_operator
begin_operator
place robot2 cucumber1 counter
0
3
0 10 2 1
0 6 -1 0
0 8 1 4
1
end_operator
begin_operator
place robot2 cucumber1 counter
0
3
0 10 3 1
0 6 -1 0
0 8 1 4
1
end_operator
begin_operator
place robot2 cucumber1 cutting_board
0
3
0 10 0 2
0 6 -1 0
0 8 1 4
1
end_operator
begin_operator
place robot2 cucumber1 cutting_board
0
3
0 10 1 2
0 6 -1 0
0 8 1 4
1
end_operator
begin_operator
place robot2 cucumber1 cutting_board
0
3
0 10 3 2
0 6 -1 0
0 8 1 4
1
end_operator
begin_operator
place robot2 cucumber2 bowl
0
3
0 11 1 0
0 7 -1 0
0 8 2 4
1
end_operator
begin_operator
place robot2 cucumber2 bowl
0
3
0 11 2 0
0 7 -1 0
0 8 2 4
1
end_operator
begin_operator
place robot2 cucumber2 bowl
0
3
0 11 3 0
0 7 -1 0
0 8 2 4
1
end_operator
begin_operator
place robot2 cucumber2 counter
0
3
0 11 0 1
0 7 -1 0
0 8 2 4
1
end_operator
begin_operator
place robot2 cucumber2 counter
0
3
0 11 2 1
0 7 -1 0
0 8 2 4
1
end_operator
begin_operator
place robot2 cucumber2 counter
0
3
0 11 3 1
0 7 -1 0
0 8 2 4
1
end_operator
begin_operator
place robot2 cucumber2 cutting_board
0
3
0 11 0 2
0 7 -1 0
0 8 2 4
1
end_operator
begin_operator
place robot2 cucumber2 cutting_board
0
3
0 11 1 2
0 7 -1 0
0 8 2 4
1
end_operator
begin_operator
place robot2 cucumber2 cutting_board
0
3
0 11 3 2
0 7 -1 0
0 8 2 4
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 0 1 0
0 3 -1 0
0 8 3 4
1
end_operator
begin_operator
place robot2 knife counter
0
3
0 1 1 0
0 3 -1 0
0 8 3 4
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 2 1 0
0 3 -1 0
0 8 3 4
1
end_operator
begin_operator
slice robot1 carrot knife cutting_board
2
9 2
4 3
1
0 13 1 0
1
end_operator
begin_operator
slice robot1 cucumber1 knife cutting_board
2
10 2
4 3
1
0 12 1 0
1
end_operator
begin_operator
slice robot1 cucumber2 knife cutting_board
2
11 2
4 3
1
0 14 1 0
1
end_operator
begin_operator
slice robot2 carrot knife cutting_board
2
9 2
8 3
1
0 13 1 0
1
end_operator
begin_operator
slice robot2 cucumber1 knife cutting_board
2
10 2
8 3
1
0 12 1 0
1
end_operator
begin_operator
slice robot2 cucumber2 knife cutting_board
2
11 2
8 3
1
0 14 1 0
1
end_operator
0
