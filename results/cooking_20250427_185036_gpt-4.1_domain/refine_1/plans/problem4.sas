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
2
Atom clear(knife1)
Atom holding(robot1, knife1)
end_variable
begin_variable
var1
-1
2
Atom at(knife1, table1)
NegatedAtom at(knife1, table1)
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
3
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
Atom clear(carrot1)
NegatedAtom clear(carrot1)
end_variable
begin_variable
var6
-1
3
Atom at(carrot1, table1)
Atom holding(robot1, carrot1)
Atom in-bowl(carrot1)
end_variable
begin_variable
var7
-1
2
Atom sliced(carrot1)
NegatedAtom sliced(carrot1)
end_variable
4
begin_mutex_group
2
1 0
0 1
end_mutex_group
begin_mutex_group
2
1 0
0 1
end_mutex_group
begin_mutex_group
2
6 1
5 0
end_mutex_group
begin_mutex_group
2
3 1
2 0
end_mutex_group
begin_state
0
0
0
0
1
0
0
1
end_state
begin_goal
4
3 2
4 0
6 2
7 0
end_goal
10
begin_operator
pick robot1 carrot1 table1
0
2
0 6 0 1
0 5 0 1
1
end_operator
begin_operator
pick robot1 knife1 table1
0
2
0 1 0 1
0 0 0 1
1
end_operator
begin_operator
pick robot1 tomato1 table1
0
2
0 3 0 1
0 2 0 1
1
end_operator
begin_operator
place robot1 carrot1 table1
0
2
0 6 1 0
0 5 -1 0
1
end_operator
begin_operator
place robot1 knife1 table1
0
2
0 1 -1 0
0 0 1 0
1
end_operator
begin_operator
place robot1 tomato1 table1
0
2
0 3 1 0
0 2 -1 0
1
end_operator
begin_operator
put-in-bowl robot1 carrot1 bowl1
1
7 0
2
0 6 1 2
0 5 -1 0
1
end_operator
begin_operator
put-in-bowl robot1 tomato1 bowl1
1
4 0
2
0 3 1 2
0 2 -1 0
1
end_operator
begin_operator
slice robot1 carrot1 knife1 table1
3
6 0
1 0
5 0
1
0 7 1 0
1
end_operator
begin_operator
slice robot1 tomato1 knife1 table1
3
1 0
3 0
2 0
1
0 4 1 0
1
end_operator
0
