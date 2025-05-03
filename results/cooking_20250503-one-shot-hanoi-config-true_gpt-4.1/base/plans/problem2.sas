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
3
Atom available(knife)
Atom carry(robot1, knife)
Atom carry(robot2, knife)
end_variable
begin_variable
var4
-1
2
Atom free(robot1)
NegatedAtom free(robot1)
end_variable
begin_variable
var5
-1
2
Atom free(robot2)
NegatedAtom free(robot2)
end_variable
begin_variable
var6
-1
2
Atom available(tomato)
NegatedAtom available(tomato)
end_variable
begin_variable
var7
-1
5
Atom at(tomato, bowl)
Atom at(tomato, counter)
Atom at(tomato, cutting_board)
Atom carry(robot1, tomato)
Atom carry(robot2, tomato)
end_variable
begin_variable
var8
-1
2
Atom is-sliced(tomato)
Atom is-whole(tomato)
end_variable
3
begin_mutex_group
3
7 3
7 4
6 0
end_mutex_group
begin_mutex_group
3
7 3
3 1
4 0
end_mutex_group
begin_mutex_group
3
7 4
3 2
5 0
end_mutex_group
begin_state
1
0
1
2
0
1
0
1
1
end_state
begin_goal
2
7 0
8 0
end_goal
26
begin_operator
pick robot1 knife bowl
0
3
0 0 0 1
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 knife counter
0
3
0 1 0 1
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 knife cutting_board
0
3
0 2 0 1
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 tomato bowl
0
3
0 7 0 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 tomato counter
0
3
0 7 1 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 tomato cutting_board
0
3
0 7 2 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot2 knife bowl
0
3
0 0 0 1
0 3 0 2
0 5 0 1
1
end_operator
begin_operator
pick robot2 knife counter
0
3
0 1 0 1
0 3 0 2
0 5 0 1
1
end_operator
begin_operator
pick robot2 knife cutting_board
0
3
0 2 0 1
0 3 0 2
0 5 0 1
1
end_operator
begin_operator
pick robot2 tomato bowl
0
3
0 7 0 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 tomato counter
0
3
0 7 1 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 tomato cutting_board
0
3
0 7 2 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 0 1 0
0 3 1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 1 1 0
0 3 1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 2 1 0
0 3 1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 7 3 0
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 7 3 1
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 7 3 2
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 0 1 0
0 3 2 0
0 5 1 0
1
end_operator
begin_operator
place robot2 knife counter
0
3
0 1 1 0
0 3 2 0
0 5 1 0
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 2 1 0
0 3 2 0
0 5 1 0
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 7 4 0
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 7 4 1
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 7 4 2
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
slice robot1 tomato knife cutting_board
2
7 2
3 1
1
0 8 1 0
1
end_operator
begin_operator
slice robot2 tomato knife cutting_board
2
7 2
3 2
1
0 8 1 0
1
end_operator
0
