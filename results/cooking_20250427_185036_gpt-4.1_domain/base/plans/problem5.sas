begin_version
3
end_version
begin_metric
0
end_metric
8
begin_variable
var0
-1
3
Atom at(knife1, cuttingboard1)
Atom at(knife1, table1)
Atom holding(robot1, knife1)
end_variable
begin_variable
var1
-1
2
Atom clear(knife1)
NegatedAtom clear(knife1)
end_variable
begin_variable
var2
-1
2
Atom clear(tomato1)
NegatedAtom clear(tomato1)
end_variable
begin_variable
var3
-1
4
Atom at(tomato1, cuttingboard1)
Atom at(tomato1, table1)
Atom holding(robot1, tomato1)
Atom in-bowl(tomato1)
end_variable
begin_variable
var4
-1
2
Atom sliced(tomato1)
NegatedAtom sliced(tomato1)
end_variable
begin_variable
var5
-1
2
Atom clear(cucumber1)
NegatedAtom clear(cucumber1)
end_variable
begin_variable
var6
-1
4
Atom at(cucumber1, cuttingboard1)
Atom at(cucumber1, table1)
Atom holding(robot1, cucumber1)
Atom in-bowl(cucumber1)
end_variable
begin_variable
var7
-1
2
Atom sliced(cucumber1)
NegatedAtom sliced(cucumber1)
end_variable
6
begin_mutex_group
2
6 2
5 0
end_mutex_group
begin_mutex_group
3
6 2
6 3
5 0
end_mutex_group
begin_mutex_group
2
0 2
1 0
end_mutex_group
begin_mutex_group
2
0 2
1 0
end_mutex_group
begin_mutex_group
2
3 2
2 0
end_mutex_group
begin_mutex_group
3
3 2
3 3
2 0
end_mutex_group
begin_state
0
0
0
1
1
0
1
1
end_state
begin_goal
4
3 3
4 0
6 3
7 0
end_goal
18
begin_operator
pick robot1 cucumber1 cuttingboard1
0
2
0 6 0 2
0 5 0 1
1
end_operator
begin_operator
pick robot1 cucumber1 table1
0
2
0 6 1 2
0 5 0 1
1
end_operator
begin_operator
pick robot1 knife1 cuttingboard1
0
2
0 0 0 2
0 1 0 1
1
end_operator
begin_operator
pick robot1 knife1 table1
0
2
0 0 1 2
0 1 0 1
1
end_operator
begin_operator
pick robot1 tomato1 cuttingboard1
0
2
0 3 0 2
0 2 0 1
1
end_operator
begin_operator
pick robot1 tomato1 table1
0
2
0 3 1 2
0 2 0 1
1
end_operator
begin_operator
place robot1 cucumber1 cuttingboard1
0
2
0 6 2 0
0 5 -1 0
1
end_operator
begin_operator
place robot1 cucumber1 table1
0
2
0 6 2 1
0 5 -1 0
1
end_operator
begin_operator
place robot1 knife1 cuttingboard1
0
2
0 0 2 0
0 1 -1 0
1
end_operator
begin_operator
place robot1 knife1 table1
0
2
0 0 2 1
0 1 -1 0
1
end_operator
begin_operator
place robot1 tomato1 cuttingboard1
0
2
0 3 2 0
0 2 -1 0
1
end_operator
begin_operator
place robot1 tomato1 table1
0
2
0 3 2 1
0 2 -1 0
1
end_operator
begin_operator
place_in_bowl robot1 cucumber1 bowl1
1
7 0
1
0 6 2 3
1
end_operator
begin_operator
place_in_bowl robot1 tomato1 bowl1
1
4 0
1
0 3 2 3
1
end_operator
begin_operator
slice robot1 cucumber1 knife1 cuttingboard1
3
6 0
0 0
5 0
1
0 7 1 0
1
end_operator
begin_operator
slice robot1 cucumber1 knife1 table1
3
6 1
0 1
5 0
1
0 7 1 0
1
end_operator
begin_operator
slice robot1 tomato1 knife1 cuttingboard1
3
0 0
3 0
2 0
1
0 4 1 0
1
end_operator
begin_operator
slice robot1 tomato1 knife1 table1
3
0 1
3 1
2 0
1
0 4 1 0
1
end_operator
0
