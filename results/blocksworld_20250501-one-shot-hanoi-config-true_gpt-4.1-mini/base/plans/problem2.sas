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
Atom holding(pink)
Atom on(pink, blue)
Atom on(pink, purple)
Atom on(pink, red)
Atom ontable(pink)
end_variable
begin_variable
var1
-1
2
Atom clear(pink)
NegatedAtom clear(pink)
end_variable
begin_variable
var2
-1
2
Atom clear(blue)
NegatedAtom clear(blue)
end_variable
begin_variable
var3
-1
2
Atom clear(purple)
NegatedAtom clear(purple)
end_variable
begin_variable
var4
-1
2
Atom clear(red)
NegatedAtom clear(red)
end_variable
begin_variable
var5
-1
2
Atom handempty(robot1)
Atom handfull(robot1)
end_variable
begin_variable
var6
-1
5
Atom holding(blue)
Atom on(blue, pink)
Atom on(blue, purple)
Atom on(blue, red)
Atom ontable(blue)
end_variable
begin_variable
var7
-1
5
Atom holding(purple)
Atom on(purple, blue)
Atom on(purple, pink)
Atom on(purple, red)
Atom ontable(purple)
end_variable
begin_variable
var8
-1
5
Atom holding(red)
Atom on(red, blue)
Atom on(red, pink)
Atom on(red, purple)
Atom ontable(red)
end_variable
5
begin_mutex_group
5
2 0
6 0
0 1
7 1
8 1
end_mutex_group
begin_mutex_group
5
1 0
6 1
0 0
7 2
8 2
end_mutex_group
begin_mutex_group
5
3 0
6 2
0 2
7 0
8 3
end_mutex_group
begin_mutex_group
5
4 0
6 3
0 3
7 3
8 0
end_mutex_group
begin_mutex_group
5
5 0
6 0
0 0
7 0
8 0
end_mutex_group
begin_state
4
0
0
0
0
0
4
4
4
end_state
begin_goal
3
6 2
7 2
8 1
end_goal
32
begin_operator
pick-up blue robot1
0
3
0 2 0 1
0 5 0 1
0 6 4 0
1
end_operator
begin_operator
pick-up pink robot1
0
3
0 1 0 1
0 5 0 1
0 0 4 0
1
end_operator
begin_operator
pick-up purple robot1
0
3
0 3 0 1
0 5 0 1
0 7 4 0
1
end_operator
begin_operator
pick-up red robot1
0
3
0 4 0 1
0 5 0 1
0 8 4 0
1
end_operator
begin_operator
put-down blue robot1
0
3
0 2 -1 0
0 5 1 0
0 6 0 4
1
end_operator
begin_operator
put-down pink robot1
0
3
0 1 -1 0
0 5 1 0
0 0 0 4
1
end_operator
begin_operator
put-down purple robot1
0
3
0 3 -1 0
0 5 1 0
0 7 0 4
1
end_operator
begin_operator
put-down red robot1
0
3
0 4 -1 0
0 5 1 0
0 8 0 4
1
end_operator
begin_operator
stack blue pink robot1
0
4
0 2 -1 0
0 1 0 1
0 5 1 0
0 6 0 1
1
end_operator
begin_operator
stack blue purple robot1
0
4
0 2 -1 0
0 3 0 1
0 5 1 0
0 6 0 2
1
end_operator
begin_operator
stack blue red robot1
0
4
0 2 -1 0
0 4 0 1
0 5 1 0
0 6 0 3
1
end_operator
begin_operator
stack pink blue robot1
0
4
0 2 0 1
0 1 -1 0
0 5 1 0
0 0 0 1
1
end_operator
begin_operator
stack pink purple robot1
0
4
0 1 -1 0
0 3 0 1
0 5 1 0
0 0 0 2
1
end_operator
begin_operator
stack pink red robot1
0
4
0 1 -1 0
0 4 0 1
0 5 1 0
0 0 0 3
1
end_operator
begin_operator
stack purple blue robot1
0
4
0 2 0 1
0 3 -1 0
0 5 1 0
0 7 0 1
1
end_operator
begin_operator
stack purple pink robot1
0
4
0 1 0 1
0 3 -1 0
0 5 1 0
0 7 0 2
1
end_operator
begin_operator
stack purple red robot1
0
4
0 3 -1 0
0 4 0 1
0 5 1 0
0 7 0 3
1
end_operator
begin_operator
stack red blue robot1
0
4
0 2 0 1
0 4 -1 0
0 5 1 0
0 8 0 1
1
end_operator
begin_operator
stack red pink robot1
0
4
0 1 0 1
0 4 -1 0
0 5 1 0
0 8 0 2
1
end_operator
begin_operator
stack red purple robot1
0
4
0 3 0 1
0 4 -1 0
0 5 1 0
0 8 0 3
1
end_operator
begin_operator
unstack blue pink robot1
0
4
0 2 0 1
0 1 -1 0
0 5 0 1
0 6 1 0
1
end_operator
begin_operator
unstack blue purple robot1
0
4
0 2 0 1
0 3 -1 0
0 5 0 1
0 6 2 0
1
end_operator
begin_operator
unstack blue red robot1
0
4
0 2 0 1
0 4 -1 0
0 5 0 1
0 6 3 0
1
end_operator
begin_operator
unstack pink blue robot1
0
4
0 2 -1 0
0 1 0 1
0 5 0 1
0 0 1 0
1
end_operator
begin_operator
unstack pink purple robot1
0
4
0 1 0 1
0 3 -1 0
0 5 0 1
0 0 2 0
1
end_operator
begin_operator
unstack pink red robot1
0
4
0 1 0 1
0 4 -1 0
0 5 0 1
0 0 3 0
1
end_operator
begin_operator
unstack purple blue robot1
0
4
0 2 -1 0
0 3 0 1
0 5 0 1
0 7 1 0
1
end_operator
begin_operator
unstack purple pink robot1
0
4
0 1 -1 0
0 3 0 1
0 5 0 1
0 7 2 0
1
end_operator
begin_operator
unstack purple red robot1
0
4
0 3 0 1
0 4 -1 0
0 5 0 1
0 7 3 0
1
end_operator
begin_operator
unstack red blue robot1
0
4
0 2 -1 0
0 4 0 1
0 5 0 1
0 8 1 0
1
end_operator
begin_operator
unstack red pink robot1
0
4
0 1 -1 0
0 4 0 1
0 5 0 1
0 8 2 0
1
end_operator
begin_operator
unstack red purple robot1
0
4
0 3 -1 0
0 4 0 1
0 5 0 1
0 8 3 0
1
end_operator
0
