begin_version
3
end_version
begin_metric
0
end_metric
23
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
4
Atom at(bowl, bowl)
Atom at(bowl, counter)
Atom at(bowl, cutting_board)
<none of those>
end_variable
begin_variable
var5
-1
2
Atom available(bowl)
NegatedAtom available(bowl)
end_variable
begin_variable
var6
-1
4
Atom at(cutting_board, bowl)
Atom at(cutting_board, counter)
Atom at(cutting_board, cutting_board)
<none of those>
end_variable
begin_variable
var7
-1
2
Atom available(cutting_board)
NegatedAtom available(cutting_board)
end_variable
begin_variable
var8
-1
4
Atom at(spatula, bowl)
Atom at(spatula, counter)
Atom at(spatula, cutting_board)
<none of those>
end_variable
begin_variable
var9
-1
2
Atom available(spatula)
NegatedAtom available(spatula)
end_variable
begin_variable
var10
-1
4
Atom at(spoon, bowl)
Atom at(spoon, counter)
Atom at(spoon, cutting_board)
<none of those>
end_variable
begin_variable
var11
-1
2
Atom available(spoon)
NegatedAtom available(spoon)
end_variable
begin_variable
var12
-1
9
Atom carry(robot1, bowl)
Atom carry(robot1, carrot)
Atom carry(robot1, cucumber)
Atom carry(robot1, cutting_board)
Atom carry(robot1, knife)
Atom carry(robot1, spatula)
Atom carry(robot1, spoon)
Atom carry(robot1, tomato)
Atom free(robot1)
end_variable
begin_variable
var13
-1
9
Atom carry(robot2, bowl)
Atom carry(robot2, carrot)
Atom carry(robot2, cucumber)
Atom carry(robot2, cutting_board)
Atom carry(robot2, knife)
Atom carry(robot2, spatula)
Atom carry(robot2, spoon)
Atom carry(robot2, tomato)
Atom free(robot2)
end_variable
begin_variable
var14
-1
4
Atom at(carrot, bowl)
Atom at(carrot, counter)
Atom at(carrot, cutting_board)
<none of those>
end_variable
begin_variable
var15
-1
2
Atom available(carrot)
NegatedAtom available(carrot)
end_variable
begin_variable
var16
-1
4
Atom at(cucumber, bowl)
Atom at(cucumber, counter)
Atom at(cucumber, cutting_board)
<none of those>
end_variable
begin_variable
var17
-1
2
Atom available(cucumber)
NegatedAtom available(cucumber)
end_variable
begin_variable
var18
-1
4
Atom at(tomato, bowl)
Atom at(tomato, counter)
Atom at(tomato, cutting_board)
<none of those>
end_variable
begin_variable
var19
-1
2
Atom available(tomato)
NegatedAtom available(tomato)
end_variable
begin_variable
var20
-1
2
Atom is-sliced(carrot)
Atom is-whole(carrot)
end_variable
begin_variable
var21
-1
2
Atom is-sliced(tomato)
Atom is-whole(tomato)
end_variable
begin_variable
var22
-1
2
Atom is-sliced(cucumber)
Atom is-whole(cucumber)
end_variable
15
begin_mutex_group
5
4 0
4 1
4 2
12 0
13 0
end_mutex_group
begin_mutex_group
5
14 0
14 1
14 2
12 1
13 1
end_mutex_group
begin_mutex_group
5
16 0
16 1
16 2
12 2
13 2
end_mutex_group
begin_mutex_group
5
6 0
6 1
6 2
12 3
13 3
end_mutex_group
begin_mutex_group
5
8 0
8 1
8 2
12 5
13 5
end_mutex_group
begin_mutex_group
5
10 0
10 1
10 2
12 6
13 6
end_mutex_group
begin_mutex_group
5
18 0
18 1
18 2
12 7
13 7
end_mutex_group
begin_mutex_group
3
5 0
12 0
13 0
end_mutex_group
begin_mutex_group
3
15 0
12 1
13 1
end_mutex_group
begin_mutex_group
3
17 0
12 2
13 2
end_mutex_group
begin_mutex_group
3
7 0
12 3
13 3
end_mutex_group
begin_mutex_group
3
3 0
12 4
13 4
end_mutex_group
begin_mutex_group
3
9 0
12 5
13 5
end_mutex_group
begin_mutex_group
3
11 0
12 6
13 6
end_mutex_group
begin_mutex_group
3
19 0
12 7
13 7
end_mutex_group
begin_state
1
1
1
1
1
0
2
0
1
0
1
0
8
4
1
0
1
0
1
0
1
1
1
end_state
begin_goal
9
14 0
15 0
16 0
17 0
18 0
19 0
20 0
21 0
22 0
end_goal
186
begin_operator
pick robot1 bowl bowl
0
3
0 4 0 3
0 5 0 1
0 12 8 0
1
end_operator
begin_operator
pick robot1 bowl counter
0
3
0 4 1 3
0 5 0 1
0 12 8 0
1
end_operator
begin_operator
pick robot1 bowl cutting_board
0
3
0 4 2 3
0 5 0 1
0 12 8 0
1
end_operator
begin_operator
pick robot1 carrot bowl
0
3
0 14 0 3
0 15 0 1
0 12 8 1
1
end_operator
begin_operator
pick robot1 carrot counter
0
3
0 14 1 3
0 15 0 1
0 12 8 1
1
end_operator
begin_operator
pick robot1 carrot cutting_board
0
3
0 14 2 3
0 15 0 1
0 12 8 1
1
end_operator
begin_operator
pick robot1 cucumber bowl
0
3
0 16 0 3
0 17 0 1
0 12 8 2
1
end_operator
begin_operator
pick robot1 cucumber counter
0
3
0 16 1 3
0 17 0 1
0 12 8 2
1
end_operator
begin_operator
pick robot1 cucumber cutting_board
0
3
0 16 2 3
0 17 0 1
0 12 8 2
1
end_operator
begin_operator
pick robot1 cutting_board bowl
0
3
0 6 0 3
0 7 0 1
0 12 8 3
1
end_operator
begin_operator
pick robot1 cutting_board counter
0
3
0 6 1 3
0 7 0 1
0 12 8 3
1
end_operator
begin_operator
pick robot1 cutting_board cutting_board
0
3
0 6 2 3
0 7 0 1
0 12 8 3
1
end_operator
begin_operator
pick robot1 knife bowl
0
3
0 0 0 1
0 3 0 1
0 12 8 4
1
end_operator
begin_operator
pick robot1 knife counter
0
3
0 1 0 1
0 3 0 1
0 12 8 4
1
end_operator
begin_operator
pick robot1 knife cutting_board
0
3
0 2 0 1
0 3 0 1
0 12 8 4
1
end_operator
begin_operator
pick robot1 spatula bowl
0
3
0 8 0 3
0 9 0 1
0 12 8 5
1
end_operator
begin_operator
pick robot1 spatula counter
0
3
0 8 1 3
0 9 0 1
0 12 8 5
1
end_operator
begin_operator
pick robot1 spatula cutting_board
0
3
0 8 2 3
0 9 0 1
0 12 8 5
1
end_operator
begin_operator
pick robot1 spoon bowl
0
3
0 10 0 3
0 11 0 1
0 12 8 6
1
end_operator
begin_operator
pick robot1 spoon counter
0
3
0 10 1 3
0 11 0 1
0 12 8 6
1
end_operator
begin_operator
pick robot1 spoon cutting_board
0
3
0 10 2 3
0 11 0 1
0 12 8 6
1
end_operator
begin_operator
pick robot1 tomato bowl
0
3
0 18 0 3
0 19 0 1
0 12 8 7
1
end_operator
begin_operator
pick robot1 tomato counter
0
3
0 18 1 3
0 19 0 1
0 12 8 7
1
end_operator
begin_operator
pick robot1 tomato cutting_board
0
3
0 18 2 3
0 19 0 1
0 12 8 7
1
end_operator
begin_operator
pick robot2 bowl bowl
0
3
0 4 0 3
0 5 0 1
0 13 8 0
1
end_operator
begin_operator
pick robot2 bowl counter
0
3
0 4 1 3
0 5 0 1
0 13 8 0
1
end_operator
begin_operator
pick robot2 bowl cutting_board
0
3
0 4 2 3
0 5 0 1
0 13 8 0
1
end_operator
begin_operator
pick robot2 carrot bowl
0
3
0 14 0 3
0 15 0 1
0 13 8 1
1
end_operator
begin_operator
pick robot2 carrot counter
0
3
0 14 1 3
0 15 0 1
0 13 8 1
1
end_operator
begin_operator
pick robot2 carrot cutting_board
0
3
0 14 2 3
0 15 0 1
0 13 8 1
1
end_operator
begin_operator
pick robot2 cucumber bowl
0
3
0 16 0 3
0 17 0 1
0 13 8 2
1
end_operator
begin_operator
pick robot2 cucumber counter
0
3
0 16 1 3
0 17 0 1
0 13 8 2
1
end_operator
begin_operator
pick robot2 cucumber cutting_board
0
3
0 16 2 3
0 17 0 1
0 13 8 2
1
end_operator
begin_operator
pick robot2 cutting_board bowl
0
3
0 6 0 3
0 7 0 1
0 13 8 3
1
end_operator
begin_operator
pick robot2 cutting_board counter
0
3
0 6 1 3
0 7 0 1
0 13 8 3
1
end_operator
begin_operator
pick robot2 cutting_board cutting_board
0
3
0 6 2 3
0 7 0 1
0 13 8 3
1
end_operator
begin_operator
pick robot2 knife bowl
0
3
0 0 0 1
0 3 0 1
0 13 8 4
1
end_operator
begin_operator
pick robot2 knife counter
0
3
0 1 0 1
0 3 0 1
0 13 8 4
1
end_operator
begin_operator
pick robot2 knife cutting_board
0
3
0 2 0 1
0 3 0 1
0 13 8 4
1
end_operator
begin_operator
pick robot2 spatula bowl
0
3
0 8 0 3
0 9 0 1
0 13 8 5
1
end_operator
begin_operator
pick robot2 spatula counter
0
3
0 8 1 3
0 9 0 1
0 13 8 5
1
end_operator
begin_operator
pick robot2 spatula cutting_board
0
3
0 8 2 3
0 9 0 1
0 13 8 5
1
end_operator
begin_operator
pick robot2 spoon bowl
0
3
0 10 0 3
0 11 0 1
0 13 8 6
1
end_operator
begin_operator
pick robot2 spoon counter
0
3
0 10 1 3
0 11 0 1
0 13 8 6
1
end_operator
begin_operator
pick robot2 spoon cutting_board
0
3
0 10 2 3
0 11 0 1
0 13 8 6
1
end_operator
begin_operator
pick robot2 tomato bowl
0
3
0 18 0 3
0 19 0 1
0 13 8 7
1
end_operator
begin_operator
pick robot2 tomato counter
0
3
0 18 1 3
0 19 0 1
0 13 8 7
1
end_operator
begin_operator
pick robot2 tomato cutting_board
0
3
0 18 2 3
0 19 0 1
0 13 8 7
1
end_operator
begin_operator
place robot1 bowl bowl
0
3
0 4 1 0
0 5 -1 0
0 12 0 8
1
end_operator
begin_operator
place robot1 bowl bowl
0
3
0 4 2 0
0 5 -1 0
0 12 0 8
1
end_operator
begin_operator
place robot1 bowl bowl
0
3
0 4 3 0
0 5 -1 0
0 12 0 8
1
end_operator
begin_operator
place robot1 bowl counter
0
3
0 4 0 1
0 5 -1 0
0 12 0 8
1
end_operator
begin_operator
place robot1 bowl counter
0
3
0 4 2 1
0 5 -1 0
0 12 0 8
1
end_operator
begin_operator
place robot1 bowl counter
0
3
0 4 3 1
0 5 -1 0
0 12 0 8
1
end_operator
begin_operator
place robot1 bowl cutting_board
0
3
0 4 0 2
0 5 -1 0
0 12 0 8
1
end_operator
begin_operator
place robot1 bowl cutting_board
0
3
0 4 1 2
0 5 -1 0
0 12 0 8
1
end_operator
begin_operator
place robot1 bowl cutting_board
0
3
0 4 3 2
0 5 -1 0
0 12 0 8
1
end_operator
begin_operator
place robot1 carrot bowl
0
3
0 14 1 0
0 15 -1 0
0 12 1 8
1
end_operator
begin_operator
place robot1 carrot bowl
0
3
0 14 2 0
0 15 -1 0
0 12 1 8
1
end_operator
begin_operator
place robot1 carrot bowl
0
3
0 14 3 0
0 15 -1 0
0 12 1 8
1
end_operator
begin_operator
place robot1 carrot counter
0
3
0 14 0 1
0 15 -1 0
0 12 1 8
1
end_operator
begin_operator
place robot1 carrot counter
0
3
0 14 2 1
0 15 -1 0
0 12 1 8
1
end_operator
begin_operator
place robot1 carrot counter
0
3
0 14 3 1
0 15 -1 0
0 12 1 8
1
end_operator
begin_operator
place robot1 carrot cutting_board
0
3
0 14 0 2
0 15 -1 0
0 12 1 8
1
end_operator
begin_operator
place robot1 carrot cutting_board
0
3
0 14 1 2
0 15 -1 0
0 12 1 8
1
end_operator
begin_operator
place robot1 carrot cutting_board
0
3
0 14 3 2
0 15 -1 0
0 12 1 8
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 16 1 0
0 17 -1 0
0 12 2 8
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 16 2 0
0 17 -1 0
0 12 2 8
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 16 3 0
0 17 -1 0
0 12 2 8
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 16 0 1
0 17 -1 0
0 12 2 8
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 16 2 1
0 17 -1 0
0 12 2 8
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 16 3 1
0 17 -1 0
0 12 2 8
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 16 0 2
0 17 -1 0
0 12 2 8
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 16 1 2
0 17 -1 0
0 12 2 8
1
end_operator
begin_operator
place robot1 cucumber cutting_board
0
3
0 16 3 2
0 17 -1 0
0 12 2 8
1
end_operator
begin_operator
place robot1 cutting_board bowl
0
3
0 6 1 0
0 7 -1 0
0 12 3 8
1
end_operator
begin_operator
place robot1 cutting_board bowl
0
3
0 6 2 0
0 7 -1 0
0 12 3 8
1
end_operator
begin_operator
place robot1 cutting_board bowl
0
3
0 6 3 0
0 7 -1 0
0 12 3 8
1
end_operator
begin_operator
place robot1 cutting_board counter
0
3
0 6 0 1
0 7 -1 0
0 12 3 8
1
end_operator
begin_operator
place robot1 cutting_board counter
0
3
0 6 2 1
0 7 -1 0
0 12 3 8
1
end_operator
begin_operator
place robot1 cutting_board counter
0
3
0 6 3 1
0 7 -1 0
0 12 3 8
1
end_operator
begin_operator
place robot1 cutting_board cutting_board
0
3
0 6 0 2
0 7 -1 0
0 12 3 8
1
end_operator
begin_operator
place robot1 cutting_board cutting_board
0
3
0 6 1 2
0 7 -1 0
0 12 3 8
1
end_operator
begin_operator
place robot1 cutting_board cutting_board
0
3
0 6 3 2
0 7 -1 0
0 12 3 8
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 0 1 0
0 3 -1 0
0 12 4 8
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 1 1 0
0 3 -1 0
0 12 4 8
1
end_operator
begin_operator
place robot1 knife cutting_board
0
3
0 2 1 0
0 3 -1 0
0 12 4 8
1
end_operator
begin_operator
place robot1 spatula bowl
0
3
0 8 1 0
0 9 -1 0
0 12 5 8
1
end_operator
begin_operator
place robot1 spatula bowl
0
3
0 8 2 0
0 9 -1 0
0 12 5 8
1
end_operator
begin_operator
place robot1 spatula bowl
0
3
0 8 3 0
0 9 -1 0
0 12 5 8
1
end_operator
begin_operator
place robot1 spatula counter
0
3
0 8 0 1
0 9 -1 0
0 12 5 8
1
end_operator
begin_operator
place robot1 spatula counter
0
3
0 8 2 1
0 9 -1 0
0 12 5 8
1
end_operator
begin_operator
place robot1 spatula counter
0
3
0 8 3 1
0 9 -1 0
0 12 5 8
1
end_operator
begin_operator
place robot1 spatula cutting_board
0
3
0 8 0 2
0 9 -1 0
0 12 5 8
1
end_operator
begin_operator
place robot1 spatula cutting_board
0
3
0 8 1 2
0 9 -1 0
0 12 5 8
1
end_operator
begin_operator
place robot1 spatula cutting_board
0
3
0 8 3 2
0 9 -1 0
0 12 5 8
1
end_operator
begin_operator
place robot1 spoon bowl
0
3
0 10 1 0
0 11 -1 0
0 12 6 8
1
end_operator
begin_operator
place robot1 spoon bowl
0
3
0 10 2 0
0 11 -1 0
0 12 6 8
1
end_operator
begin_operator
place robot1 spoon bowl
0
3
0 10 3 0
0 11 -1 0
0 12 6 8
1
end_operator
begin_operator
place robot1 spoon counter
0
3
0 10 0 1
0 11 -1 0
0 12 6 8
1
end_operator
begin_operator
place robot1 spoon counter
0
3
0 10 2 1
0 11 -1 0
0 12 6 8
1
end_operator
begin_operator
place robot1 spoon counter
0
3
0 10 3 1
0 11 -1 0
0 12 6 8
1
end_operator
begin_operator
place robot1 spoon cutting_board
0
3
0 10 0 2
0 11 -1 0
0 12 6 8
1
end_operator
begin_operator
place robot1 spoon cutting_board
0
3
0 10 1 2
0 11 -1 0
0 12 6 8
1
end_operator
begin_operator
place robot1 spoon cutting_board
0
3
0 10 3 2
0 11 -1 0
0 12 6 8
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 18 1 0
0 19 -1 0
0 12 7 8
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 18 2 0
0 19 -1 0
0 12 7 8
1
end_operator
begin_operator
place robot1 tomato bowl
0
3
0 18 3 0
0 19 -1 0
0 12 7 8
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 18 0 1
0 19 -1 0
0 12 7 8
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 18 2 1
0 19 -1 0
0 12 7 8
1
end_operator
begin_operator
place robot1 tomato counter
0
3
0 18 3 1
0 19 -1 0
0 12 7 8
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 18 0 2
0 19 -1 0
0 12 7 8
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 18 1 2
0 19 -1 0
0 12 7 8
1
end_operator
begin_operator
place robot1 tomato cutting_board
0
3
0 18 3 2
0 19 -1 0
0 12 7 8
1
end_operator
begin_operator
place robot2 bowl bowl
0
3
0 4 1 0
0 5 -1 0
0 13 0 8
1
end_operator
begin_operator
place robot2 bowl bowl
0
3
0 4 2 0
0 5 -1 0
0 13 0 8
1
end_operator
begin_operator
place robot2 bowl bowl
0
3
0 4 3 0
0 5 -1 0
0 13 0 8
1
end_operator
begin_operator
place robot2 bowl counter
0
3
0 4 0 1
0 5 -1 0
0 13 0 8
1
end_operator
begin_operator
place robot2 bowl counter
0
3
0 4 2 1
0 5 -1 0
0 13 0 8
1
end_operator
begin_operator
place robot2 bowl counter
0
3
0 4 3 1
0 5 -1 0
0 13 0 8
1
end_operator
begin_operator
place robot2 bowl cutting_board
0
3
0 4 0 2
0 5 -1 0
0 13 0 8
1
end_operator
begin_operator
place robot2 bowl cutting_board
0
3
0 4 1 2
0 5 -1 0
0 13 0 8
1
end_operator
begin_operator
place robot2 bowl cutting_board
0
3
0 4 3 2
0 5 -1 0
0 13 0 8
1
end_operator
begin_operator
place robot2 carrot bowl
0
3
0 14 1 0
0 15 -1 0
0 13 1 8
1
end_operator
begin_operator
place robot2 carrot bowl
0
3
0 14 2 0
0 15 -1 0
0 13 1 8
1
end_operator
begin_operator
place robot2 carrot bowl
0
3
0 14 3 0
0 15 -1 0
0 13 1 8
1
end_operator
begin_operator
place robot2 carrot counter
0
3
0 14 0 1
0 15 -1 0
0 13 1 8
1
end_operator
begin_operator
place robot2 carrot counter
0
3
0 14 2 1
0 15 -1 0
0 13 1 8
1
end_operator
begin_operator
place robot2 carrot counter
0
3
0 14 3 1
0 15 -1 0
0 13 1 8
1
end_operator
begin_operator
place robot2 carrot cutting_board
0
3
0 14 0 2
0 15 -1 0
0 13 1 8
1
end_operator
begin_operator
place robot2 carrot cutting_board
0
3
0 14 1 2
0 15 -1 0
0 13 1 8
1
end_operator
begin_operator
place robot2 carrot cutting_board
0
3
0 14 3 2
0 15 -1 0
0 13 1 8
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 16 1 0
0 17 -1 0
0 13 2 8
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 16 2 0
0 17 -1 0
0 13 2 8
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 16 3 0
0 17 -1 0
0 13 2 8
1
end_operator
begin_operator
place robot2 cucumber counter
0
3
0 16 0 1
0 17 -1 0
0 13 2 8
1
end_operator
begin_operator
place robot2 cucumber counter
0
3
0 16 2 1
0 17 -1 0
0 13 2 8
1
end_operator
begin_operator
place robot2 cucumber counter
0
3
0 16 3 1
0 17 -1 0
0 13 2 8
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 16 0 2
0 17 -1 0
0 13 2 8
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 16 1 2
0 17 -1 0
0 13 2 8
1
end_operator
begin_operator
place robot2 cucumber cutting_board
0
3
0 16 3 2
0 17 -1 0
0 13 2 8
1
end_operator
begin_operator
place robot2 cutting_board bowl
0
3
0 6 1 0
0 7 -1 0
0 13 3 8
1
end_operator
begin_operator
place robot2 cutting_board bowl
0
3
0 6 2 0
0 7 -1 0
0 13 3 8
1
end_operator
begin_operator
place robot2 cutting_board bowl
0
3
0 6 3 0
0 7 -1 0
0 13 3 8
1
end_operator
begin_operator
place robot2 cutting_board counter
0
3
0 6 0 1
0 7 -1 0
0 13 3 8
1
end_operator
begin_operator
place robot2 cutting_board counter
0
3
0 6 2 1
0 7 -1 0
0 13 3 8
1
end_operator
begin_operator
place robot2 cutting_board counter
0
3
0 6 3 1
0 7 -1 0
0 13 3 8
1
end_operator
begin_operator
place robot2 cutting_board cutting_board
0
3
0 6 0 2
0 7 -1 0
0 13 3 8
1
end_operator
begin_operator
place robot2 cutting_board cutting_board
0
3
0 6 1 2
0 7 -1 0
0 13 3 8
1
end_operator
begin_operator
place robot2 cutting_board cutting_board
0
3
0 6 3 2
0 7 -1 0
0 13 3 8
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 0 1 0
0 3 -1 0
0 13 4 8
1
end_operator
begin_operator
place robot2 knife counter
0
3
0 1 1 0
0 3 -1 0
0 13 4 8
1
end_operator
begin_operator
place robot2 knife cutting_board
0
3
0 2 1 0
0 3 -1 0
0 13 4 8
1
end_operator
begin_operator
place robot2 spatula bowl
0
3
0 8 1 0
0 9 -1 0
0 13 5 8
1
end_operator
begin_operator
place robot2 spatula bowl
0
3
0 8 2 0
0 9 -1 0
0 13 5 8
1
end_operator
begin_operator
place robot2 spatula bowl
0
3
0 8 3 0
0 9 -1 0
0 13 5 8
1
end_operator
begin_operator
place robot2 spatula counter
0
3
0 8 0 1
0 9 -1 0
0 13 5 8
1
end_operator
begin_operator
place robot2 spatula counter
0
3
0 8 2 1
0 9 -1 0
0 13 5 8
1
end_operator
begin_operator
place robot2 spatula counter
0
3
0 8 3 1
0 9 -1 0
0 13 5 8
1
end_operator
begin_operator
place robot2 spatula cutting_board
0
3
0 8 0 2
0 9 -1 0
0 13 5 8
1
end_operator
begin_operator
place robot2 spatula cutting_board
0
3
0 8 1 2
0 9 -1 0
0 13 5 8
1
end_operator
begin_operator
place robot2 spatula cutting_board
0
3
0 8 3 2
0 9 -1 0
0 13 5 8
1
end_operator
begin_operator
place robot2 spoon bowl
0
3
0 10 1 0
0 11 -1 0
0 13 6 8
1
end_operator
begin_operator
place robot2 spoon bowl
0
3
0 10 2 0
0 11 -1 0
0 13 6 8
1
end_operator
begin_operator
place robot2 spoon bowl
0
3
0 10 3 0
0 11 -1 0
0 13 6 8
1
end_operator
begin_operator
place robot2 spoon counter
0
3
0 10 0 1
0 11 -1 0
0 13 6 8
1
end_operator
begin_operator
place robot2 spoon counter
0
3
0 10 2 1
0 11 -1 0
0 13 6 8
1
end_operator
begin_operator
place robot2 spoon counter
0
3
0 10 3 1
0 11 -1 0
0 13 6 8
1
end_operator
begin_operator
place robot2 spoon cutting_board
0
3
0 10 0 2
0 11 -1 0
0 13 6 8
1
end_operator
begin_operator
place robot2 spoon cutting_board
0
3
0 10 1 2
0 11 -1 0
0 13 6 8
1
end_operator
begin_operator
place robot2 spoon cutting_board
0
3
0 10 3 2
0 11 -1 0
0 13 6 8
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 18 1 0
0 19 -1 0
0 13 7 8
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 18 2 0
0 19 -1 0
0 13 7 8
1
end_operator
begin_operator
place robot2 tomato bowl
0
3
0 18 3 0
0 19 -1 0
0 13 7 8
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 18 0 1
0 19 -1 0
0 13 7 8
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 18 2 1
0 19 -1 0
0 13 7 8
1
end_operator
begin_operator
place robot2 tomato counter
0
3
0 18 3 1
0 19 -1 0
0 13 7 8
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 18 0 2
0 19 -1 0
0 13 7 8
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 18 1 2
0 19 -1 0
0 13 7 8
1
end_operator
begin_operator
place robot2 tomato cutting_board
0
3
0 18 3 2
0 19 -1 0
0 13 7 8
1
end_operator
begin_operator
slice robot1 carrot knife cutting_board
2
14 2
12 4
1
0 20 1 0
1
end_operator
begin_operator
slice robot1 cucumber knife cutting_board
2
16 2
12 4
1
0 22 1 0
1
end_operator
begin_operator
slice robot1 tomato knife cutting_board
2
18 2
12 4
1
0 21 1 0
1
end_operator
begin_operator
slice robot2 carrot knife cutting_board
2
14 2
13 4
1
0 20 1 0
1
end_operator
begin_operator
slice robot2 cucumber knife cutting_board
2
16 2
13 4
1
0 22 1 0
1
end_operator
begin_operator
slice robot2 tomato knife cutting_board
2
18 2
13 4
1
0 21 1 0
1
end_operator
0
