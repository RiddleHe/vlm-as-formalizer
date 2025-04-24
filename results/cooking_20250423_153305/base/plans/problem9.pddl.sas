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
Atom at(knife1, bowl1)
Atom at(knife1, counter1)
Atom at(knife1, cutting_board1)
<none of those>
end_variable
begin_variable
var1
-1
2
Atom available(knife1)
NegatedAtom available(knife1)
end_variable
begin_variable
var2
-1
5
Atom carry(robot1, carrot1)
Atom carry(robot1, cucumber1)
Atom carry(robot1, cucumber2)
Atom carry(robot1, knife1)
Atom free(robot1)
end_variable
begin_variable
var3
-1
2
Atom available(carrot1)
NegatedAtom available(carrot1)
end_variable
begin_variable
var4
-1
2
Atom available(cucumber1)
NegatedAtom available(cucumber1)
end_variable
begin_variable
var5
-1
2
Atom available(cucumber2)
NegatedAtom available(cucumber2)
end_variable
begin_variable
var6
-1
5
Atom carry(robot2, carrot1)
Atom carry(robot2, cucumber1)
Atom carry(robot2, cucumber2)
Atom carry(robot2, knife1)
Atom free(robot2)
end_variable
begin_variable
var7
-1
4
Atom at(carrot1, bowl1)
Atom at(carrot1, counter1)
Atom at(carrot1, cutting_board1)
<none of those>
end_variable
begin_variable
var8
-1
4
Atom at(cucumber1, bowl1)
Atom at(cucumber1, counter1)
Atom at(cucumber1, cutting_board1)
<none of those>
end_variable
begin_variable
var9
-1
4
Atom at(cucumber2, bowl1)
Atom at(cucumber2, counter1)
Atom at(cucumber2, cutting_board1)
<none of those>
end_variable
begin_variable
var10
-1
2
Atom is-sliced(carrot1)
Atom is-whole(carrot1)
end_variable
8
begin_mutex_group
5
7 0
7 1
7 2
2 0
6 0
end_mutex_group
begin_mutex_group
5
8 0
8 1
8 2
2 1
6 1
end_mutex_group
begin_mutex_group
5
9 0
9 1
9 2
2 2
6 2
end_mutex_group
begin_mutex_group
5
0 0
0 1
0 2
2 3
6 3
end_mutex_group
begin_mutex_group
3
3 0
2 0
6 0
end_mutex_group
begin_mutex_group
3
4 0
2 1
6 1
end_mutex_group
begin_mutex_group
3
5 0
2 2
6 2
end_mutex_group
begin_mutex_group
3
1 0
2 3
6 3
end_mutex_group
begin_state
2
0
4
0
0
0
4
1
2
2
1
end_state
begin_goal
4
7 0
8 0
9 0
10 0
end_goal
100
begin_operator
pick robot1 carrot1 bowl1
0
3
0 7 0 3
0 3 0 1
0 2 4 0
1
end_operator
begin_operator
pick robot1 carrot1 counter1
0
3
0 7 1 3
0 3 0 1
0 2 4 0
1
end_operator
begin_operator
pick robot1 carrot1 cutting_board1
0
3
0 7 2 3
0 3 0 1
0 2 4 0
1
end_operator
begin_operator
pick robot1 cucumber1 bowl1
0
3
0 8 0 3
0 4 0 1
0 2 4 1
1
end_operator
begin_operator
pick robot1 cucumber1 counter1
0
3
0 8 1 3
0 4 0 1
0 2 4 1
1
end_operator
begin_operator
pick robot1 cucumber1 cutting_board1
0
3
0 8 2 3
0 4 0 1
0 2 4 1
1
end_operator
begin_operator
pick robot1 cucumber2 bowl1
0
3
0 9 0 3
0 5 0 1
0 2 4 2
1
end_operator
begin_operator
pick robot1 cucumber2 counter1
0
3
0 9 1 3
0 5 0 1
0 2 4 2
1
end_operator
begin_operator
pick robot1 cucumber2 cutting_board1
0
3
0 9 2 3
0 5 0 1
0 2 4 2
1
end_operator
begin_operator
pick robot1 knife1 bowl1
0
3
0 0 0 3
0 1 0 1
0 2 4 3
1
end_operator
begin_operator
pick robot1 knife1 counter1
0
3
0 0 1 3
0 1 0 1
0 2 4 3
1
end_operator
begin_operator
pick robot1 knife1 cutting_board1
0
3
0 0 2 3
0 1 0 1
0 2 4 3
1
end_operator
begin_operator
pick robot2 carrot1 bowl1
0
3
0 7 0 3
0 3 0 1
0 6 4 0
1
end_operator
begin_operator
pick robot2 carrot1 counter1
0
3
0 7 1 3
0 3 0 1
0 6 4 0
1
end_operator
begin_operator
pick robot2 carrot1 cutting_board1
0
3
0 7 2 3
0 3 0 1
0 6 4 0
1
end_operator
begin_operator
pick robot2 cucumber1 bowl1
0
3
0 8 0 3
0 4 0 1
0 6 4 1
1
end_operator
begin_operator
pick robot2 cucumber1 counter1
0
3
0 8 1 3
0 4 0 1
0 6 4 1
1
end_operator
begin_operator
pick robot2 cucumber1 cutting_board1
0
3
0 8 2 3
0 4 0 1
0 6 4 1
1
end_operator
begin_operator
pick robot2 cucumber2 bowl1
0
3
0 9 0 3
0 5 0 1
0 6 4 2
1
end_operator
begin_operator
pick robot2 cucumber2 counter1
0
3
0 9 1 3
0 5 0 1
0 6 4 2
1
end_operator
begin_operator
pick robot2 cucumber2 cutting_board1
0
3
0 9 2 3
0 5 0 1
0 6 4 2
1
end_operator
begin_operator
pick robot2 knife1 bowl1
0
3
0 0 0 3
0 1 0 1
0 6 4 3
1
end_operator
begin_operator
pick robot2 knife1 counter1
0
3
0 0 1 3
0 1 0 1
0 6 4 3
1
end_operator
begin_operator
pick robot2 knife1 cutting_board1
0
3
0 0 2 3
0 1 0 1
0 6 4 3
1
end_operator
begin_operator
place robot1 carrot1 bowl1
0
3
0 7 1 0
0 3 -1 0
0 2 0 4
1
end_operator
begin_operator
place robot1 carrot1 bowl1
0
3
0 7 2 0
0 3 -1 0
0 2 0 4
1
end_operator
begin_operator
place robot1 carrot1 bowl1
0
3
0 7 3 0
0 3 -1 0
0 2 0 4
1
end_operator
begin_operator
place robot1 carrot1 counter1
0
3
0 7 0 1
0 3 -1 0
0 2 0 4
1
end_operator
begin_operator
place robot1 carrot1 counter1
0
3
0 7 2 1
0 3 -1 0
0 2 0 4
1
end_operator
begin_operator
place robot1 carrot1 counter1
0
3
0 7 3 1
0 3 -1 0
0 2 0 4
1
end_operator
begin_operator
place robot1 carrot1 cutting_board1
0
3
0 7 0 2
0 3 -1 0
0 2 0 4
1
end_operator
begin_operator
place robot1 carrot1 cutting_board1
0
3
0 7 1 2
0 3 -1 0
0 2 0 4
1
end_operator
begin_operator
place robot1 carrot1 cutting_board1
0
3
0 7 3 2
0 3 -1 0
0 2 0 4
1
end_operator
begin_operator
place robot1 cucumber1 bowl1
0
3
0 8 1 0
0 4 -1 0
0 2 1 4
1
end_operator
begin_operator
place robot1 cucumber1 bowl1
0
3
0 8 2 0
0 4 -1 0
0 2 1 4
1
end_operator
begin_operator
place robot1 cucumber1 bowl1
0
3
0 8 3 0
0 4 -1 0
0 2 1 4
1
end_operator
begin_operator
place robot1 cucumber1 counter1
0
3
0 8 0 1
0 4 -1 0
0 2 1 4
1
end_operator
begin_operator
place robot1 cucumber1 counter1
0
3
0 8 2 1
0 4 -1 0
0 2 1 4
1
end_operator
begin_operator
place robot1 cucumber1 counter1
0
3
0 8 3 1
0 4 -1 0
0 2 1 4
1
end_operator
begin_operator
place robot1 cucumber1 cutting_board1
0
3
0 8 0 2
0 4 -1 0
0 2 1 4
1
end_operator
begin_operator
place robot1 cucumber1 cutting_board1
0
3
0 8 1 2
0 4 -1 0
0 2 1 4
1
end_operator
begin_operator
place robot1 cucumber1 cutting_board1
0
3
0 8 3 2
0 4 -1 0
0 2 1 4
1
end_operator
begin_operator
place robot1 cucumber2 bowl1
0
3
0 9 1 0
0 5 -1 0
0 2 2 4
1
end_operator
begin_operator
place robot1 cucumber2 bowl1
0
3
0 9 2 0
0 5 -1 0
0 2 2 4
1
end_operator
begin_operator
place robot1 cucumber2 bowl1
0
3
0 9 3 0
0 5 -1 0
0 2 2 4
1
end_operator
begin_operator
place robot1 cucumber2 counter1
0
3
0 9 0 1
0 5 -1 0
0 2 2 4
1
end_operator
begin_operator
place robot1 cucumber2 counter1
0
3
0 9 2 1
0 5 -1 0
0 2 2 4
1
end_operator
begin_operator
place robot1 cucumber2 counter1
0
3
0 9 3 1
0 5 -1 0
0 2 2 4
1
end_operator
begin_operator
place robot1 cucumber2 cutting_board1
0
3
0 9 0 2
0 5 -1 0
0 2 2 4
1
end_operator
begin_operator
place robot1 cucumber2 cutting_board1
0
3
0 9 1 2
0 5 -1 0
0 2 2 4
1
end_operator
begin_operator
place robot1 cucumber2 cutting_board1
0
3
0 9 3 2
0 5 -1 0
0 2 2 4
1
end_operator
begin_operator
place robot1 knife1 bowl1
0
3
0 0 1 0
0 1 -1 0
0 2 3 4
1
end_operator
begin_operator
place robot1 knife1 bowl1
0
3
0 0 2 0
0 1 -1 0
0 2 3 4
1
end_operator
begin_operator
place robot1 knife1 bowl1
0
3
0 0 3 0
0 1 -1 0
0 2 3 4
1
end_operator
begin_operator
place robot1 knife1 counter1
0
3
0 0 0 1
0 1 -1 0
0 2 3 4
1
end_operator
begin_operator
place robot1 knife1 counter1
0
3
0 0 2 1
0 1 -1 0
0 2 3 4
1
end_operator
begin_operator
place robot1 knife1 counter1
0
3
0 0 3 1
0 1 -1 0
0 2 3 4
1
end_operator
begin_operator
place robot1 knife1 cutting_board1
0
3
0 0 0 2
0 1 -1 0
0 2 3 4
1
end_operator
begin_operator
place robot1 knife1 cutting_board1
0
3
0 0 1 2
0 1 -1 0
0 2 3 4
1
end_operator
begin_operator
place robot1 knife1 cutting_board1
0
3
0 0 3 2
0 1 -1 0
0 2 3 4
1
end_operator
begin_operator
place robot2 carrot1 bowl1
0
3
0 7 1 0
0 3 -1 0
0 6 0 4
1
end_operator
begin_operator
place robot2 carrot1 bowl1
0
3
0 7 2 0
0 3 -1 0
0 6 0 4
1
end_operator
begin_operator
place robot2 carrot1 bowl1
0
3
0 7 3 0
0 3 -1 0
0 6 0 4
1
end_operator
begin_operator
place robot2 carrot1 counter1
0
3
0 7 0 1
0 3 -1 0
0 6 0 4
1
end_operator
begin_operator
place robot2 carrot1 counter1
0
3
0 7 2 1
0 3 -1 0
0 6 0 4
1
end_operator
begin_operator
place robot2 carrot1 counter1
0
3
0 7 3 1
0 3 -1 0
0 6 0 4
1
end_operator
begin_operator
place robot2 carrot1 cutting_board1
0
3
0 7 0 2
0 3 -1 0
0 6 0 4
1
end_operator
begin_operator
place robot2 carrot1 cutting_board1
0
3
0 7 1 2
0 3 -1 0
0 6 0 4
1
end_operator
begin_operator
place robot2 carrot1 cutting_board1
0
3
0 7 3 2
0 3 -1 0
0 6 0 4
1
end_operator
begin_operator
place robot2 cucumber1 bowl1
0
3
0 8 1 0
0 4 -1 0
0 6 1 4
1
end_operator
begin_operator
place robot2 cucumber1 bowl1
0
3
0 8 2 0
0 4 -1 0
0 6 1 4
1
end_operator
begin_operator
place robot2 cucumber1 bowl1
0
3
0 8 3 0
0 4 -1 0
0 6 1 4
1
end_operator
begin_operator
place robot2 cucumber1 counter1
0
3
0 8 0 1
0 4 -1 0
0 6 1 4
1
end_operator
begin_operator
place robot2 cucumber1 counter1
0
3
0 8 2 1
0 4 -1 0
0 6 1 4
1
end_operator
begin_operator
place robot2 cucumber1 counter1
0
3
0 8 3 1
0 4 -1 0
0 6 1 4
1
end_operator
begin_operator
place robot2 cucumber1 cutting_board1
0
3
0 8 0 2
0 4 -1 0
0 6 1 4
1
end_operator
begin_operator
place robot2 cucumber1 cutting_board1
0
3
0 8 1 2
0 4 -1 0
0 6 1 4
1
end_operator
begin_operator
place robot2 cucumber1 cutting_board1
0
3
0 8 3 2
0 4 -1 0
0 6 1 4
1
end_operator
begin_operator
place robot2 cucumber2 bowl1
0
3
0 9 1 0
0 5 -1 0
0 6 2 4
1
end_operator
begin_operator
place robot2 cucumber2 bowl1
0
3
0 9 2 0
0 5 -1 0
0 6 2 4
1
end_operator
begin_operator
place robot2 cucumber2 bowl1
0
3
0 9 3 0
0 5 -1 0
0 6 2 4
1
end_operator
begin_operator
place robot2 cucumber2 counter1
0
3
0 9 0 1
0 5 -1 0
0 6 2 4
1
end_operator
begin_operator
place robot2 cucumber2 counter1
0
3
0 9 2 1
0 5 -1 0
0 6 2 4
1
end_operator
begin_operator
place robot2 cucumber2 counter1
0
3
0 9 3 1
0 5 -1 0
0 6 2 4
1
end_operator
begin_operator
place robot2 cucumber2 cutting_board1
0
3
0 9 0 2
0 5 -1 0
0 6 2 4
1
end_operator
begin_operator
place robot2 cucumber2 cutting_board1
0
3
0 9 1 2
0 5 -1 0
0 6 2 4
1
end_operator
begin_operator
place robot2 cucumber2 cutting_board1
0
3
0 9 3 2
0 5 -1 0
0 6 2 4
1
end_operator
begin_operator
place robot2 knife1 bowl1
0
3
0 0 1 0
0 1 -1 0
0 6 3 4
1
end_operator
begin_operator
place robot2 knife1 bowl1
0
3
0 0 2 0
0 1 -1 0
0 6 3 4
1
end_operator
begin_operator
place robot2 knife1 bowl1
0
3
0 0 3 0
0 1 -1 0
0 6 3 4
1
end_operator
begin_operator
place robot2 knife1 counter1
0
3
0 0 0 1
0 1 -1 0
0 6 3 4
1
end_operator
begin_operator
place robot2 knife1 counter1
0
3
0 0 2 1
0 1 -1 0
0 6 3 4
1
end_operator
begin_operator
place robot2 knife1 counter1
0
3
0 0 3 1
0 1 -1 0
0 6 3 4
1
end_operator
begin_operator
place robot2 knife1 cutting_board1
0
3
0 0 0 2
0 1 -1 0
0 6 3 4
1
end_operator
begin_operator
place robot2 knife1 cutting_board1
0
3
0 0 1 2
0 1 -1 0
0 6 3 4
1
end_operator
begin_operator
place robot2 knife1 cutting_board1
0
3
0 0 3 2
0 1 -1 0
0 6 3 4
1
end_operator
begin_operator
slice robot1 carrot1 knife1 counter1
2
7 1
2 3
1
0 10 1 0
1
end_operator
begin_operator
slice robot1 carrot1 knife1 cutting_board1
2
7 2
2 3
1
0 10 1 0
1
end_operator
begin_operator
slice robot2 carrot1 knife1 counter1
2
7 1
6 3
1
0 10 1 0
1
end_operator
begin_operator
slice robot2 carrot1 knife1 cutting_board1
2
7 2
6 3
1
0 10 1 0
1
end_operator
0
