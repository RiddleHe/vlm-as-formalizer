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
5
Atom at(knife, bowl)
Atom at(knife, counter)
Atom at(knife, cutting_board)
Atom carry(left_robot, knife)
Atom carry(right_robot, knife)
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
Atom free(left_robot)
NegatedAtom free(left_robot)
end_variable
begin_variable
var3
-1
2
Atom free(right_robot)
NegatedAtom free(right_robot)
end_variable
begin_variable
var4
-1
2
Atom available(carrot)
NegatedAtom available(carrot)
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
5
Atom at(carrot, bowl)
Atom at(carrot, counter)
Atom at(carrot, cutting_board)
Atom carry(left_robot, carrot)
Atom carry(right_robot, carrot)
end_variable
begin_variable
var7
-1
5
Atom at(tomato, bowl)
Atom at(tomato, counter)
Atom at(tomato, cutting_board)
Atom carry(left_robot, tomato)
Atom carry(right_robot, tomato)
end_variable
begin_variable
var8
-1
2
Atom is-sliced(carrot)
Atom is-whole(carrot)
end_variable
begin_variable
var9
-1
2
Atom is-sliced(tomato)
Atom is-whole(tomato)
end_variable
5
begin_mutex_group
3
6 3
6 4
4 0
end_mutex_group
begin_mutex_group
3
0 3
0 4
1 0
end_mutex_group
begin_mutex_group
3
7 3
7 4
5 0
end_mutex_group
begin_mutex_group
4
6 3
0 3
7 3
2 0
end_mutex_group
begin_mutex_group
4
6 4
0 4
7 4
3 0
end_mutex_group
begin_state
1
0
0
0
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
pick left_robot carrot bowl
0
3
0 6 0 3
0 4 0 1
0 2 0 1
1
end_operator
begin_operator
pick left_robot carrot counter
0
3
0 6 1 3
0 4 0 1
0 2 0 1
1
end_operator
begin_operator
pick left_robot carrot cutting_board
0
3
0 6 2 3
0 4 0 1
0 2 0 1
1
end_operator
begin_operator
pick left_robot knife bowl
0
3
0 0 0 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick left_robot knife counter
0
3
0 0 1 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick left_robot knife cutting_board
0
3
0 0 2 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick left_robot tomato bowl
0
3
0 7 0 3
0 5 0 1
0 2 0 1
1
end_operator
begin_operator
pick left_robot tomato counter
0
3
0 7 1 3
0 5 0 1
0 2 0 1
1
end_operator
begin_operator
pick left_robot tomato cutting_board
0
3
0 7 2 3
0 5 0 1
0 2 0 1
1
end_operator
begin_operator
pick right_robot carrot bowl
0
3
0 6 0 4
0 4 0 1
0 3 0 1
1
end_operator
begin_operator
pick right_robot carrot counter
0
3
0 6 1 4
0 4 0 1
0 3 0 1
1
end_operator
begin_operator
pick right_robot carrot cutting_board
0
3
0 6 2 4
0 4 0 1
0 3 0 1
1
end_operator
begin_operator
pick right_robot knife bowl
0
3
0 0 0 4
0 1 0 1
0 3 0 1
1
end_operator
begin_operator
pick right_robot knife counter
0
3
0 0 1 4
0 1 0 1
0 3 0 1
1
end_operator
begin_operator
pick right_robot knife cutting_board
0
3
0 0 2 4
0 1 0 1
0 3 0 1
1
end_operator
begin_operator
pick right_robot tomato bowl
0
3
0 7 0 4
0 5 0 1
0 3 0 1
1
end_operator
begin_operator
pick right_robot tomato counter
0
3
0 7 1 4
0 5 0 1
0 3 0 1
1
end_operator
begin_operator
pick right_robot tomato cutting_board
0
3
0 7 2 4
0 5 0 1
0 3 0 1
1
end_operator
begin_operator
place left_robot carrot bowl
0
3
0 6 3 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
place left_robot carrot counter
0
3
0 6 3 1
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
place left_robot carrot cutting_board
0
3
0 6 3 2
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
place left_robot knife bowl
0
3
0 0 3 0
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place left_robot knife counter
0
3
0 0 3 1
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place left_robot knife cutting_board
0
3
0 0 3 2
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place left_robot tomato bowl
0
3
0 7 3 0
0 5 -1 0
0 2 1 0
1
end_operator
begin_operator
place left_robot tomato counter
0
3
0 7 3 1
0 5 -1 0
0 2 1 0
1
end_operator
begin_operator
place left_robot tomato cutting_board
0
3
0 7 3 2
0 5 -1 0
0 2 1 0
1
end_operator
begin_operator
place right_robot carrot bowl
0
3
0 6 4 0
0 4 -1 0
0 3 1 0
1
end_operator
begin_operator
place right_robot carrot counter
0
3
0 6 4 1
0 4 -1 0
0 3 1 0
1
end_operator
begin_operator
place right_robot carrot cutting_board
0
3
0 6 4 2
0 4 -1 0
0 3 1 0
1
end_operator
begin_operator
place right_robot knife bowl
0
3
0 0 4 0
0 1 -1 0
0 3 1 0
1
end_operator
begin_operator
place right_robot knife counter
0
3
0 0 4 1
0 1 -1 0
0 3 1 0
1
end_operator
begin_operator
place right_robot knife cutting_board
0
3
0 0 4 2
0 1 -1 0
0 3 1 0
1
end_operator
begin_operator
place right_robot tomato bowl
0
3
0 7 4 0
0 5 -1 0
0 3 1 0
1
end_operator
begin_operator
place right_robot tomato counter
0
3
0 7 4 1
0 5 -1 0
0 3 1 0
1
end_operator
begin_operator
place right_robot tomato cutting_board
0
3
0 7 4 2
0 5 -1 0
0 3 1 0
1
end_operator
begin_operator
slice left_robot carrot knife cutting_board
2
6 2
0 3
1
0 8 1 0
1
end_operator
begin_operator
slice left_robot tomato knife cutting_board
2
0 3
7 2
1
0 9 1 0
1
end_operator
begin_operator
slice right_robot carrot knife cutting_board
2
6 2
0 4
1
0 8 1 0
1
end_operator
begin_operator
slice right_robot tomato knife cutting_board
2
0 4
7 2
1
0 9 1 0
1
end_operator
0
