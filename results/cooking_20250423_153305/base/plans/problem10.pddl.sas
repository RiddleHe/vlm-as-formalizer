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
5
Atom at(knife1, bowl1)
Atom at(knife1, counter1)
Atom at(knife1, cutting_board1)
Atom carry(robot1, knife1)
Atom carry(robot2, knife1)
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
2
Atom free(robot1)
NegatedAtom free(robot1)
end_variable
begin_variable
var3
-1
2
Atom free(robot2)
NegatedAtom free(robot2)
end_variable
begin_variable
var4
-1
2
Atom available(carrot1)
NegatedAtom available(carrot1)
end_variable
begin_variable
var5
-1
2
Atom available(tomato1)
NegatedAtom available(tomato1)
end_variable
begin_variable
var6
-1
5
Atom at(carrot1, bowl1)
Atom at(carrot1, counter1)
Atom at(carrot1, cutting_board1)
Atom carry(robot1, carrot1)
Atom carry(robot2, carrot1)
end_variable
begin_variable
var7
-1
5
Atom at(tomato1, bowl1)
Atom at(tomato1, counter1)
Atom at(tomato1, cutting_board1)
Atom carry(robot1, tomato1)
Atom carry(robot2, tomato1)
end_variable
begin_variable
var8
-1
2
Atom is-sliced(tomato1)
Atom is-whole(tomato1)
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
2
0
0
0
0
0
2
1
1
end_state
begin_goal
3
6 0
7 0
8 0
end_goal
40
begin_operator
pick robot1 carrot1 bowl1
0
3
0 6 0 3
0 4 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 carrot1 counter1
0
3
0 6 1 3
0 4 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 carrot1 cutting_board1
0
3
0 6 2 3
0 4 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 knife1 bowl1
0
3
0 0 0 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 knife1 counter1
0
3
0 0 1 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 knife1 cutting_board1
0
3
0 0 2 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 tomato1 bowl1
0
3
0 7 0 3
0 5 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 tomato1 counter1
0
3
0 7 1 3
0 5 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 tomato1 cutting_board1
0
3
0 7 2 3
0 5 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot2 carrot1 bowl1
0
3
0 6 0 4
0 4 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 carrot1 counter1
0
3
0 6 1 4
0 4 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 carrot1 cutting_board1
0
3
0 6 2 4
0 4 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 knife1 bowl1
0
3
0 0 0 4
0 1 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 knife1 counter1
0
3
0 0 1 4
0 1 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 knife1 cutting_board1
0
3
0 0 2 4
0 1 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 tomato1 bowl1
0
3
0 7 0 4
0 5 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 tomato1 counter1
0
3
0 7 1 4
0 5 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 tomato1 cutting_board1
0
3
0 7 2 4
0 5 0 1
0 3 0 1
1
end_operator
begin_operator
place robot1 carrot1 bowl1
0
3
0 6 3 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 carrot1 counter1
0
3
0 6 3 1
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 carrot1 cutting_board1
0
3
0 6 3 2
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 knife1 bowl1
0
3
0 0 3 0
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 knife1 counter1
0
3
0 0 3 1
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 knife1 cutting_board1
0
3
0 0 3 2
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 tomato1 bowl1
0
3
0 7 3 0
0 5 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 tomato1 counter1
0
3
0 7 3 1
0 5 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 tomato1 cutting_board1
0
3
0 7 3 2
0 5 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot2 carrot1 bowl1
0
3
0 6 4 0
0 4 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 carrot1 counter1
0
3
0 6 4 1
0 4 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 carrot1 cutting_board1
0
3
0 6 4 2
0 4 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 knife1 bowl1
0
3
0 0 4 0
0 1 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 knife1 counter1
0
3
0 0 4 1
0 1 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 knife1 cutting_board1
0
3
0 0 4 2
0 1 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 tomato1 bowl1
0
3
0 7 4 0
0 5 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 tomato1 counter1
0
3
0 7 4 1
0 5 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 tomato1 cutting_board1
0
3
0 7 4 2
0 5 -1 0
0 3 1 0
1
end_operator
begin_operator
slice robot1 tomato1 knife1 counter1
2
0 3
7 1
1
0 8 1 0
1
end_operator
begin_operator
slice robot1 tomato1 knife1 cutting_board1
2
0 3
7 2
1
0 8 1 0
1
end_operator
begin_operator
slice robot2 tomato1 knife1 counter1
2
0 4
7 1
1
0 8 1 0
1
end_operator
begin_operator
slice robot2 tomato1 knife1 cutting_board1
2
0 4
7 2
1
0 8 1 0
1
end_operator
0
