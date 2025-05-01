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
5
Atom at(knife, bowl)
Atom at(knife, counter)
Atom at(knife, cuttingboard)
Atom carry(robot1, knife)
Atom carry(robot2, knife)
end_variable
begin_variable
var1
-1
2
Atom available(knife)
NegatedAtom available(knife)
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
Atom available(carrot)
NegatedAtom available(carrot)
end_variable
begin_variable
var5
-1
2
Atom available(cucumber)
NegatedAtom available(cucumber)
end_variable
begin_variable
var6
-1
5
Atom at(carrot, bowl)
Atom at(carrot, counter)
Atom at(carrot, cuttingboard)
Atom carry(robot1, carrot)
Atom carry(robot2, carrot)
end_variable
begin_variable
var7
-1
5
Atom at(cucumber, bowl)
Atom at(cucumber, counter)
Atom at(cucumber, cuttingboard)
Atom carry(robot1, cucumber)
Atom carry(robot2, cucumber)
end_variable
begin_variable
var8
-1
2
Atom is-sliced(carrot)
NegatedAtom is-sliced(carrot)
end_variable
begin_variable
var9
-1
2
Atom is-whole(carrot)
NegatedAtom is-whole(carrot)
end_variable
4
begin_mutex_group
3
6 3
6 4
4 0
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
7 3
0 3
2 0
end_mutex_group
begin_mutex_group
2
8 0
9 0
end_mutex_group
begin_state
4
0
0
0
0
0
1
2
1
0
end_state
begin_goal
4
6 0
7 0
8 0
9 1
end_goal
40
begin_operator
pick robot1 carrot bowl
0
3
0 6 0 3
0 4 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 carrot counter
0
3
0 6 1 3
0 4 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 carrot cuttingboard
0
3
0 6 2 3
0 4 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 cucumber bowl
0
3
0 7 0 3
0 5 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 cucumber counter
0
3
0 7 1 3
0 5 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 cucumber cuttingboard
0
3
0 7 2 3
0 5 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 knife bowl
0
3
0 0 0 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 knife counter
0
3
0 0 1 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot1 knife cuttingboard
0
3
0 0 2 3
0 1 0 1
0 2 0 1
1
end_operator
begin_operator
pick robot2 carrot bowl
0
3
0 6 0 4
0 4 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 carrot counter
0
3
0 6 1 4
0 4 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 carrot cuttingboard
0
3
0 6 2 4
0 4 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 cucumber bowl
0
3
0 7 0 4
0 5 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 cucumber counter
0
3
0 7 1 4
0 5 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 cucumber cuttingboard
0
3
0 7 2 4
0 5 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 knife bowl
0
3
0 0 0 4
0 1 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 knife counter
0
3
0 0 1 4
0 1 0 1
0 3 0 1
1
end_operator
begin_operator
pick robot2 knife cuttingboard
0
3
0 0 2 4
0 1 0 1
0 3 0 1
1
end_operator
begin_operator
place robot1 carrot bowl
0
3
0 6 3 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 carrot counter
0
3
0 6 3 1
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 carrot cuttingboard
0
3
0 6 3 2
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 cucumber bowl
0
3
0 7 3 0
0 5 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 cucumber counter
0
3
0 7 3 1
0 5 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 cucumber cuttingboard
0
3
0 7 3 2
0 5 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 knife bowl
0
3
0 0 3 0
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 knife counter
0
3
0 0 3 1
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot1 knife cuttingboard
0
3
0 0 3 2
0 1 -1 0
0 2 1 0
1
end_operator
begin_operator
place robot2 carrot bowl
0
3
0 6 4 0
0 4 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 carrot counter
0
3
0 6 4 1
0 4 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 carrot cuttingboard
0
3
0 6 4 2
0 4 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 cucumber bowl
0
3
0 7 4 0
0 5 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 cucumber counter
0
3
0 7 4 1
0 5 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 cucumber cuttingboard
0
3
0 7 4 2
0 5 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 knife bowl
0
3
0 0 4 0
0 1 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 knife counter
0
3
0 0 4 1
0 1 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot2 knife cuttingboard
0
3
0 0 4 2
0 1 -1 0
0 3 1 0
1
end_operator
begin_operator
slice robot1 carrot knife counter
2
6 1
0 3
2
0 8 1 0
0 9 0 1
1
end_operator
begin_operator
slice robot1 carrot knife cuttingboard
2
6 2
0 3
2
0 8 1 0
0 9 0 1
1
end_operator
begin_operator
slice robot2 carrot knife counter
2
6 1
0 4
2
0 8 1 0
0 9 0 1
1
end_operator
begin_operator
slice robot2 carrot knife cuttingboard
2
6 2
0 4
2
0 8 1 0
0 9 0 1
1
end_operator
0
