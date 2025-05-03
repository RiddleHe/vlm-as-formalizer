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
2
Atom at(knife1, bowl1)
NegatedAtom at(knife1, bowl1)
end_variable
begin_variable
var1
-1
2
Atom at(knife1, counter)
NegatedAtom at(knife1, counter)
end_variable
begin_variable
var2
-1
2
Atom at(knife1, cutting_board)
NegatedAtom at(knife1, cutting_board)
end_variable
begin_variable
var3
-1
3
Atom available(knife1)
Atom carry(robot1, knife1)
Atom carry(robot2, knife1)
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
Atom available(carrot1)
NegatedAtom available(carrot1)
end_variable
begin_variable
var7
-1
2
Atom available(tomato1)
NegatedAtom available(tomato1)
end_variable
begin_variable
var8
-1
5
Atom at(carrot1, bowl1)
Atom at(carrot1, counter)
Atom at(carrot1, cutting_board)
Atom carry(robot1, carrot1)
Atom carry(robot2, carrot1)
end_variable
begin_variable
var9
-1
5
Atom at(tomato1, bowl1)
Atom at(tomato1, counter)
Atom at(tomato1, cutting_board)
Atom carry(robot1, tomato1)
Atom carry(robot2, tomato1)
end_variable
begin_variable
var10
-1
2
Atom is-sliced(tomato1)
Atom is-whole(tomato1)
end_variable
4
begin_mutex_group
3
8 3
8 4
6 0
end_mutex_group
begin_mutex_group
3
9 3
9 4
7 0
end_mutex_group
begin_mutex_group
4
8 3
9 3
3 1
4 0
end_mutex_group
begin_mutex_group
4
8 4
9 4
3 2
5 0
end_mutex_group
begin_state
1
1
1
2
0
1
0
0
2
1
1
end_state
begin_goal
3
8 0
9 0
10 0
end_goal
40
begin_operator
pick robot1 carrot1 bowl1
0
3
0 8 0 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 carrot1 counter
0
3
0 8 1 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 carrot1 cutting_board
0
3
0 8 2 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 knife1 bowl1
0
3
0 0 0 1
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 knife1 counter
0
3
0 1 0 1
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 knife1 cutting_board
0
3
0 2 0 1
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 tomato1 bowl1
0
3
0 9 0 3
0 7 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 tomato1 counter
0
3
0 9 1 3
0 7 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 tomato1 cutting_board
0
3
0 9 2 3
0 7 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot2 carrot1 bowl1
0
3
0 8 0 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 carrot1 counter
0
3
0 8 1 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 carrot1 cutting_board
0
3
0 8 2 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 knife1 bowl1
0
3
0 0 0 1
0 3 0 2
0 5 0 1
1
end_operator
begin_operator
pick robot2 knife1 counter
0
3
0 1 0 1
0 3 0 2
0 5 0 1
1
end_operator
begin_operator
pick robot2 knife1 cutting_board
0
3
0 2 0 1
0 3 0 2
0 5 0 1
1
end_operator
begin_operator
pick robot2 tomato1 bowl1
0
3
0 9 0 4
0 7 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 tomato1 counter
0
3
0 9 1 4
0 7 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 tomato1 cutting_board
0
3
0 9 2 4
0 7 0 1
0 5 0 1
1
end_operator
begin_operator
place robot1 carrot1 bowl1
0
3
0 8 3 0
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 carrot1 counter
0
3
0 8 3 1
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 carrot1 cutting_board
0
3
0 8 3 2
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 knife1 bowl1
0
3
0 0 1 0
0 3 1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 knife1 counter
0
3
0 1 1 0
0 3 1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 knife1 cutting_board
0
3
0 2 1 0
0 3 1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 tomato1 bowl1
0
3
0 9 3 0
0 7 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 tomato1 counter
0
3
0 9 3 1
0 7 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 tomato1 cutting_board
0
3
0 9 3 2
0 7 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot2 carrot1 bowl1
0
3
0 8 4 0
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 carrot1 counter
0
3
0 8 4 1
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 carrot1 cutting_board
0
3
0 8 4 2
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 knife1 bowl1
0
3
0 0 1 0
0 3 2 0
0 5 1 0
1
end_operator
begin_operator
place robot2 knife1 counter
0
3
0 1 1 0
0 3 2 0
0 5 1 0
1
end_operator
begin_operator
place robot2 knife1 cutting_board
0
3
0 2 1 0
0 3 2 0
0 5 1 0
1
end_operator
begin_operator
place robot2 tomato1 bowl1
0
3
0 9 4 0
0 7 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 tomato1 counter
0
3
0 9 4 1
0 7 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 tomato1 cutting_board
0
3
0 9 4 2
0 7 -1 0
0 5 1 0
1
end_operator
begin_operator
slice robot1 tomato1 knife1 counter
2
9 1
3 1
1
0 10 1 0
1
end_operator
begin_operator
slice robot1 tomato1 knife1 cutting_board
2
9 2
3 1
1
0 10 1 0
1
end_operator
begin_operator
slice robot2 tomato1 knife1 counter
2
9 1
3 2
1
0 10 1 0
1
end_operator
begin_operator
slice robot2 tomato1 knife1 cutting_board
2
9 2
3 2
1
0 10 1 0
1
end_operator
0
