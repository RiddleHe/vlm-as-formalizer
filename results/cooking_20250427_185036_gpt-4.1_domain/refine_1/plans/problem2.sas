begin_version
3
end_version
begin_metric
0
end_metric
18
begin_variable
var0
-1
2
Atom at(bowl1, cutting_board1)
NegatedAtom at(bowl1, cutting_board1)
end_variable
begin_variable
var1
-1
2
Atom at(bowl1, table1)
NegatedAtom at(bowl1, table1)
end_variable
begin_variable
var2
-1
2
Atom holding(robot1, bowl1)
NegatedAtom holding(robot1, bowl1)
end_variable
begin_variable
var3
-1
2
Atom clear(bowl1)
NegatedAtom clear(bowl1)
end_variable
begin_variable
var4
-1
2
Atom at(knife1, cutting_board1)
NegatedAtom at(knife1, cutting_board1)
end_variable
begin_variable
var5
-1
2
Atom at(knife1, table1)
NegatedAtom at(knife1, table1)
end_variable
begin_variable
var6
-1
2
Atom holding(robot1, knife1)
NegatedAtom holding(robot1, knife1)
end_variable
begin_variable
var7
-1
2
Atom clear(knife1)
NegatedAtom clear(knife1)
end_variable
begin_variable
var8
-1
2
Atom holding(robot1, tomato1)
NegatedAtom holding(robot1, tomato1)
end_variable
begin_variable
var9
-1
2
Atom clear(tomato1)
NegatedAtom clear(tomato1)
end_variable
begin_variable
var10
-1
2
Atom at(tomato1, cutting_board1)
NegatedAtom at(tomato1, cutting_board1)
end_variable
begin_variable
var11
-1
2
Atom at(tomato1, table1)
NegatedAtom at(tomato1, table1)
end_variable
begin_variable
var12
-1
2
Atom sliced(tomato1)
NegatedAtom sliced(tomato1)
end_variable
begin_variable
var13
-1
2
Atom at(sliced_tomato1, cutting_board1)
NegatedAtom at(sliced_tomato1, cutting_board1)
end_variable
begin_variable
var14
-1
2
Atom at(sliced_tomato1, table1)
NegatedAtom at(sliced_tomato1, table1)
end_variable
begin_variable
var15
-1
2
Atom holding(robot1, sliced_tomato1)
NegatedAtom holding(robot1, sliced_tomato1)
end_variable
begin_variable
var16
-1
2
Atom clear(sliced_tomato1)
NegatedAtom clear(sliced_tomato1)
end_variable
begin_variable
var17
-1
2
Atom in(sliced_tomato1, bowl1)
NegatedAtom in(sliced_tomato1, bowl1)
end_variable
0
begin_state
1
0
1
0
0
1
0
1
1
0
1
0
1
1
1
1
0
1
end_state
begin_goal
2
12 0
17 0
end_goal
26
begin_operator
pick robot1 bowl1 cutting_board1
0
3
0 0 0 1
0 3 0 1
0 2 1 0
1
end_operator
begin_operator
pick robot1 bowl1 table1
0
3
0 1 0 1
0 3 0 1
0 2 1 0
1
end_operator
begin_operator
pick robot1 knife1 cutting_board1
0
3
0 4 0 1
0 7 0 1
0 6 1 0
1
end_operator
begin_operator
pick robot1 knife1 table1
0
3
0 5 0 1
0 7 0 1
0 6 1 0
1
end_operator
begin_operator
pick robot1 sliced_tomato1 cutting_board1
0
3
0 13 0 1
0 16 0 1
0 15 1 0
1
end_operator
begin_operator
pick robot1 sliced_tomato1 table1
0
3
0 14 0 1
0 16 0 1
0 15 1 0
1
end_operator
begin_operator
pick robot1 tomato1 cutting_board1
0
3
0 10 0 1
0 9 0 1
0 8 1 0
1
end_operator
begin_operator
pick robot1 tomato1 table1
0
3
0 11 0 1
0 9 0 1
0 8 1 0
1
end_operator
begin_operator
place robot1 bowl1 cutting_board1
0
3
0 0 -1 0
0 3 -1 0
0 2 0 1
1
end_operator
begin_operator
place robot1 bowl1 table1
0
3
0 1 -1 0
0 3 -1 0
0 2 0 1
1
end_operator
begin_operator
place robot1 knife1 cutting_board1
0
3
0 4 -1 0
0 7 -1 0
0 6 0 1
1
end_operator
begin_operator
place robot1 knife1 table1
0
3
0 5 -1 0
0 7 -1 0
0 6 0 1
1
end_operator
begin_operator
place robot1 sliced_tomato1 cutting_board1
0
3
0 13 -1 0
0 16 -1 0
0 15 0 1
1
end_operator
begin_operator
place robot1 sliced_tomato1 table1
0
3
0 14 -1 0
0 16 -1 0
0 15 0 1
1
end_operator
begin_operator
place robot1 tomato1 cutting_board1
0
3
0 10 -1 0
0 9 -1 0
0 8 0 1
1
end_operator
begin_operator
place robot1 tomato1 table1
0
3
0 11 -1 0
0 9 -1 0
0 8 0 1
1
end_operator
begin_operator
put-in robot1 bowl1 bowl1 cutting_board1
1
0 0
2
0 3 -1 0
0 2 0 1
1
end_operator
begin_operator
put-in robot1 bowl1 bowl1 table1
1
1 0
2
0 3 -1 0
0 2 0 1
1
end_operator
begin_operator
put-in robot1 knife1 bowl1 cutting_board1
1
0 0
2
0 7 -1 0
0 6 0 1
1
end_operator
begin_operator
put-in robot1 knife1 bowl1 table1
1
1 0
2
0 7 -1 0
0 6 0 1
1
end_operator
begin_operator
put-in robot1 sliced_tomato1 bowl1 cutting_board1
1
0 0
3
0 16 -1 0
0 15 0 1
0 17 -1 0
1
end_operator
begin_operator
put-in robot1 sliced_tomato1 bowl1 table1
1
1 0
3
0 16 -1 0
0 15 0 1
0 17 -1 0
1
end_operator
begin_operator
put-in robot1 tomato1 bowl1 cutting_board1
1
0 0
2
0 9 -1 0
0 8 0 1
1
end_operator
begin_operator
put-in robot1 tomato1 bowl1 table1
1
1 0
2
0 9 -1 0
0 8 0 1
1
end_operator
begin_operator
slice robot1 tomato1 knife1 cutting_board1 sliced_tomato1
2
9 0
6 0
4
0 13 -1 0
0 10 0 1
0 16 -1 0
0 12 1 0
1
end_operator
begin_operator
slice robot1 tomato1 knife1 table1 sliced_tomato1
2
9 0
6 0
4
0 14 -1 0
0 11 0 1
0 16 -1 0
0 12 1 0
1
end_operator
0
