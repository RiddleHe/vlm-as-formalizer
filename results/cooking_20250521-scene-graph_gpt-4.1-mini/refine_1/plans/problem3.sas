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
Atom at(bowl, black_platform)
Atom at(bowl, bowl_platform)
Atom at(bowl, cutting_board)
Atom carry(robot1, bowl)
Atom carry(robot2, bowl)
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
5
Atom at(knife, black_platform)
Atom at(knife, bowl_platform)
Atom at(knife, cutting_board)
Atom carry(robot1, knife)
Atom carry(robot2, knife)
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
Atom available(carrot)
NegatedAtom available(carrot)
end_variable
begin_variable
var7
-1
5
Atom at(carrot, black_platform)
Atom at(carrot, bowl_platform)
Atom at(carrot, cutting_board)
Atom carry(robot1, carrot)
Atom carry(robot2, carrot)
end_variable
begin_variable
var8
-1
2
Atom is-sliced(carrot)
Atom is-whole(carrot)
end_variable
5
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
6 0
end_mutex_group
begin_mutex_group
3
2 3
2 4
3 0
end_mutex_group
begin_mutex_group
4
0 3
7 3
2 3
4 0
end_mutex_group
begin_mutex_group
4
0 4
7 4
2 4
5 0
end_mutex_group
begin_state
1
0
4
1
0
1
0
0
1
end_state
begin_goal
2
7 1
8 0
end_goal
38
begin_operator
pick robot1 bowl black_platform
0
3
0 0 0 3
0 1 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 bowl bowl_platform
0
3
0 0 1 3
0 1 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 bowl cutting_board
0
3
0 0 2 3
0 1 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 carrot black_platform
0
3
0 7 0 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 carrot bowl_platform
0
3
0 7 1 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 carrot cutting_board
0
3
0 7 2 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 knife black_platform
0
3
0 2 0 3
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 knife bowl_platform
0
3
0 2 1 3
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot1 knife cutting_board
0
3
0 2 2 3
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick robot2 bowl black_platform
0
3
0 0 0 4
0 1 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 bowl bowl_platform
0
3
0 0 1 4
0 1 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 bowl cutting_board
0
3
0 0 2 4
0 1 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 carrot black_platform
0
3
0 7 0 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 carrot bowl_platform
0
3
0 7 1 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 carrot cutting_board
0
3
0 7 2 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 knife black_platform
0
3
0 2 0 4
0 3 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 knife bowl_platform
0
3
0 2 1 4
0 3 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot2 knife cutting_board
0
3
0 2 2 4
0 3 0 1
0 5 0 1
1
end_operator
begin_operator
place robot1 bowl black_platform
0
3
0 0 3 0
0 1 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 bowl bowl_platform
0
3
0 0 3 1
0 1 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 bowl cutting_board
0
3
0 0 3 2
0 1 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 carrot black_platform
0
3
0 7 3 0
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 carrot bowl_platform
0
3
0 7 3 1
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 carrot cutting_board
0
3
0 7 3 2
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 knife black_platform
0
3
0 2 3 0
0 3 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 knife bowl_platform
0
3
0 2 3 1
0 3 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 2 3 2
0 3 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot2 bowl black_platform
0
3
0 0 4 0
0 1 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 bowl bowl_platform
0
3
0 0 4 1
0 1 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 bowl cutting_board
0
3
0 0 4 2
0 1 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 carrot black_platform
0
3
0 7 4 0
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 carrot bowl_platform
0
3
0 7 4 1
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 carrot cutting_board
0
3
0 7 4 2
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 knife black_platform
0
3
0 2 4 0
0 3 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 knife bowl_platform
0
3
0 2 4 1
0 3 -1 0
0 5 1 0
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 2 4 2
0 3 -1 0
0 5 1 0
1
end_operator
begin_operator
slice robot1 carrot knife cutting_board
2
7 2
2 3
1
0 8 1 0
1
end_operator
begin_operator
slice robot2 carrot knife cutting_board
2
7 2
2 4
1
0 8 1 0
1
end_operator
0
