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
Atom carry(r1, knife)
Atom carry(r2, knife)
end_variable
begin_variable
var4
-1
2
Atom free(r1)
NegatedAtom free(r1)
end_variable
begin_variable
var5
-1
2
Atom free(r2)
NegatedAtom free(r2)
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
2
Atom available(cucumber)
NegatedAtom available(cucumber)
end_variable
begin_variable
var8
-1
5
Atom at(carrot, bowl)
Atom at(carrot, counter)
Atom at(carrot, cutting_board)
Atom carry(r1, carrot)
Atom carry(r2, carrot)
end_variable
begin_variable
var9
-1
5
Atom at(cucumber, bowl)
Atom at(cucumber, counter)
Atom at(cucumber, cutting_board)
Atom carry(r1, cucumber)
Atom carry(r2, cucumber)
end_variable
begin_variable
var10
-1
2
Atom is-sliced(carrot)
Atom is-whole(carrot)
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
1
2
1
end_state
begin_goal
3
8 0
9 0
10 0
end_goal
38
begin_operator
pick r1 carrot bowl
0
3
0 8 0 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick r1 carrot counter
0
3
0 8 1 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick r1 carrot cutting_board
0
3
0 8 2 3
0 6 0 1
0 4 0 1
1
end_operator
begin_operator
pick r1 cucumber bowl
0
3
0 9 0 3
0 7 0 1
0 4 0 1
1
end_operator
begin_operator
pick r1 cucumber counter
0
3
0 9 1 3
0 7 0 1
0 4 0 1
1
end_operator
begin_operator
pick r1 cucumber cutting_board
0
3
0 9 2 3
0 7 0 1
0 4 0 1
1
end_operator
begin_operator
pick r1 knife bowl
0
3
0 0 0 1
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick r1 knife counter
0
3
0 1 0 1
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick r1 knife cutting_board
0
3
0 2 0 1
0 3 0 1
0 4 0 1
1
end_operator
begin_operator
pick r2 carrot bowl
0
3
0 8 0 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick r2 carrot counter
0
3
0 8 1 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick r2 carrot cutting_board
0
3
0 8 2 4
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick r2 cucumber bowl
0
3
0 9 0 4
0 7 0 1
0 5 0 1
1
end_operator
begin_operator
pick r2 cucumber counter
0
3
0 9 1 4
0 7 0 1
0 5 0 1
1
end_operator
begin_operator
pick r2 cucumber cutting_board
0
3
0 9 2 4
0 7 0 1
0 5 0 1
1
end_operator
begin_operator
pick r2 knife bowl
0
3
0 0 0 1
0 3 0 2
0 5 0 1
1
end_operator
begin_operator
pick r2 knife counter
0
3
0 1 0 1
0 3 0 2
0 5 0 1
1
end_operator
begin_operator
pick r2 knife cutting_board
0
3
0 2 0 1
0 3 0 2
0 5 0 1
1
end_operator
begin_operator
place r1 carrot bowl
0
3
0 8 3 0
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place r1 carrot counter
0
3
0 8 3 1
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place r1 carrot cutting_board
0
3
0 8 3 2
0 6 -1 0
0 4 1 0
1
end_operator
begin_operator
place r1 cucumber bowl
0
3
0 9 3 0
0 7 -1 0
0 4 1 0
1
end_operator
begin_operator
place r1 cucumber counter
0
3
0 9 3 1
0 7 -1 0
0 4 1 0
1
end_operator
begin_operator
place r1 cucumber cutting_board
0
3
0 9 3 2
0 7 -1 0
0 4 1 0
1
end_operator
begin_operator
place r1 knife bowl
0
3
0 0 1 0
0 3 1 0
0 4 1 0
1
end_operator
begin_operator
place r1 knife counter
0
3
0 1 1 0
0 3 1 0
0 4 1 0
1
end_operator
begin_operator
place r1 knife cutting_board
0
3
0 2 1 0
0 3 1 0
0 4 1 0
1
end_operator
begin_operator
place r2 carrot bowl
0
3
0 8 4 0
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place r2 carrot counter
0
3
0 8 4 1
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place r2 carrot cutting_board
0
3
0 8 4 2
0 6 -1 0
0 5 1 0
1
end_operator
begin_operator
place r2 cucumber bowl
0
3
0 9 4 0
0 7 -1 0
0 5 1 0
1
end_operator
begin_operator
place r2 cucumber counter
0
3
0 9 4 1
0 7 -1 0
0 5 1 0
1
end_operator
begin_operator
place r2 cucumber cutting_board
0
3
0 9 4 2
0 7 -1 0
0 5 1 0
1
end_operator
begin_operator
place r2 knife bowl
0
3
0 0 1 0
0 3 2 0
0 5 1 0
1
end_operator
begin_operator
place r2 knife counter
0
3
0 1 1 0
0 3 2 0
0 5 1 0
1
end_operator
begin_operator
place r2 knife cutting_board
0
3
0 2 1 0
0 3 2 0
0 5 1 0
1
end_operator
begin_operator
slice r1 carrot knife cutting_board
2
8 2
3 1
1
0 10 1 0
1
end_operator
begin_operator
slice r2 carrot knife cutting_board
2
8 2
3 2
1
0 10 1 0
1
end_operator
0
