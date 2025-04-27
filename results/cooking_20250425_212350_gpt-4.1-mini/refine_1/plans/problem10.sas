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
2
Atom available(carrot)
NegatedAtom available(carrot)
end_variable
begin_variable
var3
-1
2
Atom available(tom)
NegatedAtom available(tom)
end_variable
begin_variable
var4
-1
4
Atom carry(robot1, carrot)
Atom carry(robot1, knife)
Atom carry(robot1, tom)
Atom free(robot1)
end_variable
begin_variable
var5
-1
3
Atom at(carrot, bowl)
Atom at(carrot, cutting_board)
<none of those>
end_variable
begin_variable
var6
-1
3
Atom at(tom, bowl)
Atom at(tom, cutting_board)
<none of those>
end_variable
begin_variable
var7
-1
2
Atom is-sliced(tom)
NegatedAtom is-sliced(tom)
end_variable
begin_variable
var8
-1
2
Atom is-whole(tom)
NegatedAtom is-whole(tom)
end_variable
7
begin_mutex_group
3
5 0
5 1
4 0
end_mutex_group
begin_mutex_group
3
0 0
0 1
4 1
end_mutex_group
begin_mutex_group
3
6 0
6 1
4 2
end_mutex_group
begin_mutex_group
2
2 0
4 0
end_mutex_group
begin_mutex_group
2
1 0
4 1
end_mutex_group
begin_mutex_group
2
3 0
4 2
end_mutex_group
begin_mutex_group
2
7 0
8 0
end_mutex_group
begin_state
1
0
0
0
3
0
1
1
0
end_state
begin_goal
4
5 0
6 0
7 0
8 1
end_goal
19
begin_operator
pick robot1 carrot bowl
0
3
0 5 0 2
0 2 0 1
0 4 3 0
1
end_operator
begin_operator
pick robot1 carrot cutting_board
0
3
0 5 1 2
0 2 0 1
0 4 3 0
1
end_operator
begin_operator
pick robot1 knife bowl
0
3
0 0 0 2
0 1 0 1
0 4 3 1
1
end_operator
begin_operator
pick robot1 knife cutting_board
0
3
0 0 1 2
0 1 0 1
0 4 3 1
1
end_operator
begin_operator
pick robot1 tom bowl
0
3
0 6 0 2
0 3 0 1
0 4 3 2
1
end_operator
begin_operator
pick robot1 tom cutting_board
0
3
0 6 1 2
0 3 0 1
0 4 3 2
1
end_operator
begin_operator
place robot1 carrot bowl
0
3
0 5 1 0
0 2 -1 0
0 4 0 3
1
end_operator
begin_operator
place robot1 carrot bowl
0
3
0 5 2 0
0 2 -1 0
0 4 0 3
1
end_operator
begin_operator
place robot1 carrot cutting_board
0
3
0 5 0 1
0 2 -1 0
0 4 0 3
1
end_operator
begin_operator
place robot1 carrot cutting_board
0
3
0 5 2 1
0 2 -1 0
0 4 0 3
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 0 1 0
0 1 -1 0
0 4 1 3
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 0 2 0
0 1 -1 0
0 4 1 3
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 0 0 1
0 1 -1 0
0 4 1 3
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 0 2 1
0 1 -1 0
0 4 1 3
1
end_operator
begin_operator
place robot1 tom bowl
0
3
0 6 1 0
0 3 -1 0
0 4 2 3
1
end_operator
begin_operator
place robot1 tom bowl
0
3
0 6 2 0
0 3 -1 0
0 4 2 3
1
end_operator
begin_operator
place robot1 tom cutting_board
0
3
0 6 0 1
0 3 -1 0
0 4 2 3
1
end_operator
begin_operator
place robot1 tom cutting_board
0
3
0 6 2 1
0 3 -1 0
0 4 2 3
1
end_operator
begin_operator
slice robot1 tom knife cutting_board
2
6 1
4 1
2
0 7 1 0
0 8 0 1
1
end_operator
0
