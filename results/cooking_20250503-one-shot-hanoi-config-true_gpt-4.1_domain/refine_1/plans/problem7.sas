begin_version
3
end_version
begin_metric
0
end_metric
10
begin_variable
var0
-1
2
Atom at(bowl1, table)
NegatedAtom at(bowl1, table)
end_variable
begin_variable
var1
-1
2
Atom at(knife1, table)
NegatedAtom at(knife1, table)
end_variable
begin_variable
var2
-1
6
Atom handempty(robot1)
Atom holding(robot1, bowl1)
Atom holding(robot1, carrot)
Atom holding(robot1, cucumber)
Atom holding(robot1, knife1)
Atom holding(robot1, tomato)
end_variable
begin_variable
var3
-1
6
Atom handempty(robot2)
Atom holding(robot2, bowl1)
Atom holding(robot2, carrot)
Atom holding(robot2, cucumber)
Atom holding(robot2, knife1)
Atom holding(robot2, tomato)
end_variable
begin_variable
var4
-1
2
Atom sliced(carrot)
NegatedAtom sliced(carrot)
end_variable
begin_variable
var5
-1
2
Atom sliced(cucumber)
NegatedAtom sliced(cucumber)
end_variable
begin_variable
var6
-1
2
Atom sliced(tomato)
NegatedAtom sliced(tomato)
end_variable
begin_variable
var7
-1
3
Atom at(carrot, table)
Atom in-bowl(carrot, bowl1)
<none of those>
end_variable
begin_variable
var8
-1
3
Atom at(cucumber, table)
Atom in-bowl(cucumber, bowl1)
<none of those>
end_variable
begin_variable
var9
-1
3
Atom at(tomato, table)
Atom in-bowl(tomato, bowl1)
<none of those>
end_variable
10
begin_mutex_group
3
0 0
2 1
3 1
end_mutex_group
begin_mutex_group
3
0 0
2 1
3 1
end_mutex_group
begin_mutex_group
3
7 0
2 2
3 2
end_mutex_group
begin_mutex_group
4
7 0
7 1
2 2
3 2
end_mutex_group
begin_mutex_group
3
8 0
2 3
3 3
end_mutex_group
begin_mutex_group
4
8 0
8 1
2 3
3 3
end_mutex_group
begin_mutex_group
3
1 0
2 4
3 4
end_mutex_group
begin_mutex_group
3
1 0
2 4
3 4
end_mutex_group
begin_mutex_group
3
9 0
2 5
3 5
end_mutex_group
begin_mutex_group
4
9 0
9 1
2 5
3 5
end_mutex_group
begin_state
0
0
0
0
1
1
1
0
0
0
end_state
begin_goal
6
4 0
5 0
6 0
7 1
8 1
9 1
end_goal
32
begin_operator
pick robot1 bowl1 table
0
2
0 0 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 carrot table
0
2
0 7 0 2
0 2 0 2
1
end_operator
begin_operator
pick robot1 cucumber table
0
2
0 8 0 2
0 2 0 3
1
end_operator
begin_operator
pick robot1 knife1 table
0
2
0 1 0 1
0 2 0 4
1
end_operator
begin_operator
pick robot1 tomato table
0
2
0 9 0 2
0 2 0 5
1
end_operator
begin_operator
pick robot2 bowl1 table
0
2
0 0 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 carrot table
0
2
0 7 0 2
0 3 0 2
1
end_operator
begin_operator
pick robot2 cucumber table
0
2
0 8 0 2
0 3 0 3
1
end_operator
begin_operator
pick robot2 knife1 table
0
2
0 1 0 1
0 3 0 4
1
end_operator
begin_operator
pick robot2 tomato table
0
2
0 9 0 2
0 3 0 5
1
end_operator
begin_operator
place robot1 bowl1 table
0
2
0 0 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 carrot table
0
2
0 7 -1 0
0 2 2 0
1
end_operator
begin_operator
place robot1 cucumber table
0
2
0 8 -1 0
0 2 3 0
1
end_operator
begin_operator
place robot1 knife1 table
0
2
0 1 -1 0
0 2 4 0
1
end_operator
begin_operator
place robot1 tomato table
0
2
0 9 -1 0
0 2 5 0
1
end_operator
begin_operator
place robot2 bowl1 table
0
2
0 0 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 carrot table
0
2
0 7 -1 0
0 3 2 0
1
end_operator
begin_operator
place robot2 cucumber table
0
2
0 8 -1 0
0 3 3 0
1
end_operator
begin_operator
place robot2 knife1 table
0
2
0 1 -1 0
0 3 4 0
1
end_operator
begin_operator
place robot2 tomato table
0
2
0 9 -1 0
0 3 5 0
1
end_operator
begin_operator
put-in-bowl robot1 carrot bowl1 table
2
0 0
4 0
2
0 7 -1 1
0 2 2 0
1
end_operator
begin_operator
put-in-bowl robot1 cucumber bowl1 table
2
0 0
5 0
2
0 8 -1 1
0 2 3 0
1
end_operator
begin_operator
put-in-bowl robot1 tomato bowl1 table
2
0 0
6 0
2
0 9 -1 1
0 2 5 0
1
end_operator
begin_operator
put-in-bowl robot2 carrot bowl1 table
2
0 0
4 0
2
0 7 -1 1
0 3 2 0
1
end_operator
begin_operator
put-in-bowl robot2 cucumber bowl1 table
2
0 0
5 0
2
0 8 -1 1
0 3 3 0
1
end_operator
begin_operator
put-in-bowl robot2 tomato bowl1 table
2
0 0
6 0
2
0 9 -1 1
0 3 5 0
1
end_operator
begin_operator
slice robot1 carrot knife1 table
2
7 0
2 4
1
0 4 1 0
1
end_operator
begin_operator
slice robot1 cucumber knife1 table
2
8 0
2 4
1
0 5 1 0
1
end_operator
begin_operator
slice robot1 tomato knife1 table
2
9 0
2 4
1
0 6 1 0
1
end_operator
begin_operator
slice robot2 carrot knife1 table
2
7 0
3 4
1
0 4 1 0
1
end_operator
begin_operator
slice robot2 cucumber knife1 table
2
8 0
3 4
1
0 5 1 0
1
end_operator
begin_operator
slice robot2 tomato knife1 table
2
9 0
3 4
1
0 6 1 0
1
end_operator
0
