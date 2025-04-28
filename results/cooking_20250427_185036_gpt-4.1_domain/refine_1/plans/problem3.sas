begin_version
3
end_version
begin_metric
0
end_metric
19
begin_variable
var0
-1
2
Atom at(bowl1, cutting_board)
NegatedAtom at(bowl1, cutting_board)
end_variable
begin_variable
var1
-1
2
Atom at(bowl1, table)
NegatedAtom at(bowl1, table)
end_variable
begin_variable
var2
-1
2
Atom clear(bowl1)
NegatedAtom clear(bowl1)
end_variable
begin_variable
var3
-1
2
Atom holding(robot1, bowl1)
NegatedAtom holding(robot1, bowl1)
end_variable
begin_variable
var4
-1
2
Atom at(knife1, cutting_board)
NegatedAtom at(knife1, cutting_board)
end_variable
begin_variable
var5
-1
2
Atom at(knife1, table)
NegatedAtom at(knife1, table)
end_variable
begin_variable
var6
-1
2
Atom clear(knife1)
NegatedAtom clear(knife1)
end_variable
begin_variable
var7
-1
2
Atom holding(robot1, knife1)
NegatedAtom holding(robot1, knife1)
end_variable
begin_variable
var8
-1
2
Atom at(carrot1, cutting_board)
NegatedAtom at(carrot1, cutting_board)
end_variable
begin_variable
var9
-1
2
Atom at(carrot1, table)
NegatedAtom at(carrot1, table)
end_variable
begin_variable
var10
-1
2
Atom clear(carrot1)
NegatedAtom clear(carrot1)
end_variable
begin_variable
var11
-1
2
Atom holding(robot1, carrot1)
NegatedAtom holding(robot1, carrot1)
end_variable
begin_variable
var12
-1
2
Atom is_vegetable(carrot1)
Atom sliced_from(carrot1_sliced, carrot1)
end_variable
begin_variable
var13
-1
2
Atom is_sliced_vegetable(carrot1_sliced)
NegatedAtom is_sliced_vegetable(carrot1_sliced)
end_variable
begin_variable
var14
-1
2
Atom at(carrot1_sliced, cutting_board)
NegatedAtom at(carrot1_sliced, cutting_board)
end_variable
begin_variable
var15
-1
2
Atom at(carrot1_sliced, table)
NegatedAtom at(carrot1_sliced, table)
end_variable
begin_variable
var16
-1
2
Atom clear(carrot1_sliced)
NegatedAtom clear(carrot1_sliced)
end_variable
begin_variable
var17
-1
2
Atom holding(robot1, carrot1_sliced)
NegatedAtom holding(robot1, carrot1_sliced)
end_variable
begin_variable
var18
-1
2
Atom in_bowl(carrot1_sliced, bowl1)
NegatedAtom in_bowl(carrot1_sliced, bowl1)
end_variable
1
begin_mutex_group
2
13 0
12 0
end_mutex_group
begin_state
1
0
0
1
0
1
0
1
1
0
0
1
0
1
1
1
1
1
1
end_state
begin_goal
3
12 1
13 0
18 0
end_goal
22
begin_operator
pick robot1 bowl1 cutting_board
0
3
0 0 0 1
0 2 0 1
0 3 -1 0
1
end_operator
begin_operator
pick robot1 bowl1 table
0
3
0 1 0 1
0 2 0 1
0 3 -1 0
1
end_operator
begin_operator
pick robot1 carrot1 cutting_board
0
3
0 8 0 1
0 10 0 1
0 11 -1 0
1
end_operator
begin_operator
pick robot1 carrot1 table
0
3
0 9 0 1
0 10 0 1
0 11 -1 0
1
end_operator
begin_operator
pick robot1 carrot1_sliced cutting_board
0
3
0 14 0 1
0 16 0 1
0 17 -1 0
1
end_operator
begin_operator
pick robot1 carrot1_sliced table
0
3
0 15 0 1
0 16 0 1
0 17 -1 0
1
end_operator
begin_operator
pick robot1 knife1 cutting_board
0
3
0 4 0 1
0 6 0 1
0 7 -1 0
1
end_operator
begin_operator
pick robot1 knife1 table
0
3
0 5 0 1
0 6 0 1
0 7 -1 0
1
end_operator
begin_operator
place robot1 bowl1 cutting_board
0
3
0 0 -1 0
0 2 -1 0
0 3 0 1
1
end_operator
begin_operator
place robot1 bowl1 table
0
3
0 1 -1 0
0 2 -1 0
0 3 0 1
1
end_operator
begin_operator
place robot1 carrot1 cutting_board
0
3
0 8 -1 0
0 10 -1 0
0 11 0 1
1
end_operator
begin_operator
place robot1 carrot1 table
0
3
0 9 -1 0
0 10 -1 0
0 11 0 1
1
end_operator
begin_operator
place robot1 carrot1_sliced cutting_board
0
3
0 14 -1 0
0 16 -1 0
0 17 0 1
1
end_operator
begin_operator
place robot1 carrot1_sliced table
0
3
0 15 -1 0
0 16 -1 0
0 17 0 1
1
end_operator
begin_operator
place robot1 knife1 cutting_board
0
3
0 4 -1 0
0 6 -1 0
0 7 0 1
1
end_operator
begin_operator
place robot1 knife1 table
0
3
0 5 -1 0
0 6 -1 0
0 7 0 1
1
end_operator
begin_operator
put-in-bowl robot1 bowl1 bowl1
1
2 0
1
0 3 0 1
1
end_operator
begin_operator
put-in-bowl robot1 carrot1 bowl1
1
2 0
1
0 11 0 1
1
end_operator
begin_operator
put-in-bowl robot1 carrot1_sliced bowl1
1
2 0
2
0 17 0 1
0 18 -1 0
1
end_operator
begin_operator
put-in-bowl robot1 knife1 bowl1
1
2 0
1
0 7 0 1
1
end_operator
begin_operator
slice robot1 carrot1 knife1 cutting_board carrot1_sliced
2
4 0
10 0
5
0 16 -1 0
0 11 0 1
0 17 -1 0
0 13 -1 0
0 12 0 1
1
end_operator
begin_operator
slice robot1 carrot1 knife1 table carrot1_sliced
2
5 0
10 0
5
0 16 -1 0
0 11 0 1
0 17 -1 0
0 13 -1 0
0 12 0 1
1
end_operator
0
