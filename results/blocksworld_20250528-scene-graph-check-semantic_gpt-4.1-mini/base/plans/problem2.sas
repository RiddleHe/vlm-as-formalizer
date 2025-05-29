begin_version
3
end_version
begin_metric
0
end_metric
12
begin_variable
var0
-1
2
Atom ontable(pink)
NegatedAtom ontable(pink)
end_variable
begin_variable
var1
-1
2
Atom on(pink, pink)
NegatedAtom on(pink, pink)
end_variable
begin_variable
var2
-1
2
Atom holding(pink)
NegatedAtom holding(pink)
end_variable
begin_variable
var3
-1
2
Atom clear(pink)
NegatedAtom clear(pink)
end_variable
begin_variable
var4
-1
3
Atom clear(blue)
Atom on(pink, blue)
<none of those>
end_variable
begin_variable
var5
-1
3
Atom clear(purple)
Atom on(pink, purple)
<none of those>
end_variable
begin_variable
var6
-1
3
Atom clear(red)
Atom on(pink, red)
<none of those>
end_variable
begin_variable
var7
-1
2
Atom handempty(robot1)
NegatedAtom handempty(robot1)
end_variable
begin_variable
var8
-1
2
Atom handfull(robot1)
NegatedAtom handfull(robot1)
end_variable
begin_variable
var9
-1
5
Atom holding(blue)
Atom on(blue, pink)
Atom on(blue, purple)
Atom on(blue, red)
Atom ontable(blue)
end_variable
begin_variable
var10
-1
5
Atom holding(purple)
Atom on(purple, blue)
Atom on(purple, pink)
Atom on(purple, red)
Atom ontable(purple)
end_variable
begin_variable
var11
-1
5
Atom holding(red)
Atom on(red, blue)
Atom on(red, pink)
Atom on(red, purple)
Atom ontable(red)
end_variable
3
begin_mutex_group
5
4 0
4 1
9 0
10 1
11 1
end_mutex_group
begin_mutex_group
5
5 0
5 1
9 2
10 0
11 3
end_mutex_group
begin_mutex_group
5
6 0
6 1
9 3
10 3
11 0
end_mutex_group
begin_state
0
1
0
0
2
2
0
0
0
2
4
1
end_state
begin_goal
3
9 2
10 2
11 1
end_goal
34
begin_operator
pick-up blue robot1
0
4
0 4 0 2
0 7 0 1
0 8 -1 0
0 9 4 0
1
end_operator
begin_operator
pick-up pink robot1
0
5
0 3 0 1
0 7 0 1
0 8 -1 0
0 2 -1 0
0 0 0 1
1
end_operator
begin_operator
pick-up purple robot1
0
4
0 5 0 2
0 7 0 1
0 8 -1 0
0 10 4 0
1
end_operator
begin_operator
pick-up red robot1
0
4
0 6 0 2
0 7 0 1
0 8 -1 0
0 11 4 0
1
end_operator
begin_operator
put-down blue robot1
0
4
0 4 -1 0
0 7 -1 0
0 8 0 1
0 9 0 4
1
end_operator
begin_operator
put-down pink robot1
0
5
0 3 -1 0
0 7 -1 0
0 8 0 1
0 2 0 1
0 0 -1 0
1
end_operator
begin_operator
put-down purple robot1
0
4
0 5 -1 0
0 7 -1 0
0 8 0 1
0 10 0 4
1
end_operator
begin_operator
put-down red robot1
0
4
0 6 -1 0
0 7 -1 0
0 8 0 1
0 11 0 4
1
end_operator
begin_operator
stack blue pink robot1
0
5
0 4 -1 0
0 3 0 1
0 7 -1 0
0 8 0 1
0 9 0 1
1
end_operator
begin_operator
stack blue purple robot1
0
5
0 4 -1 0
0 5 0 2
0 7 -1 0
0 8 0 1
0 9 0 2
1
end_operator
begin_operator
stack blue red robot1
0
5
0 4 -1 0
0 6 0 2
0 7 -1 0
0 8 0 1
0 9 0 3
1
end_operator
begin_operator
stack pink blue robot1
0
5
0 4 0 1
0 3 -1 0
0 7 -1 0
0 8 0 1
0 2 0 1
1
end_operator
begin_operator
stack pink pink robot1
1
3 0
4
0 7 -1 0
0 8 0 1
0 2 0 1
0 1 -1 0
1
end_operator
begin_operator
stack pink purple robot1
0
5
0 3 -1 0
0 5 0 1
0 7 -1 0
0 8 0 1
0 2 0 1
1
end_operator
begin_operator
stack pink red robot1
0
5
0 3 -1 0
0 6 0 1
0 7 -1 0
0 8 0 1
0 2 0 1
1
end_operator
begin_operator
stack purple blue robot1
0
5
0 4 0 2
0 5 -1 0
0 7 -1 0
0 8 0 1
0 10 0 1
1
end_operator
begin_operator
stack purple pink robot1
0
5
0 3 0 1
0 5 -1 0
0 7 -1 0
0 8 0 1
0 10 0 2
1
end_operator
begin_operator
stack purple red robot1
0
5
0 5 -1 0
0 6 0 2
0 7 -1 0
0 8 0 1
0 10 0 3
1
end_operator
begin_operator
stack red blue robot1
0
5
0 4 0 2
0 6 -1 0
0 7 -1 0
0 8 0 1
0 11 0 1
1
end_operator
begin_operator
stack red pink robot1
0
5
0 3 0 1
0 6 -1 0
0 7 -1 0
0 8 0 1
0 11 0 2
1
end_operator
begin_operator
stack red purple robot1
0
5
0 5 0 2
0 6 -1 0
0 7 -1 0
0 8 0 1
0 11 0 3
1
end_operator
begin_operator
unstack blue pink robot1
0
5
0 4 0 2
0 3 -1 0
0 7 0 1
0 8 -1 0
0 9 1 0
1
end_operator
begin_operator
unstack blue purple robot1
0
5
0 4 0 2
0 5 -1 0
0 7 0 1
0 8 -1 0
0 9 2 0
1
end_operator
begin_operator
unstack blue red robot1
0
5
0 4 0 2
0 6 -1 0
0 7 0 1
0 8 -1 0
0 9 3 0
1
end_operator
begin_operator
unstack pink blue robot1
0
5
0 4 1 0
0 3 0 1
0 7 0 1
0 8 -1 0
0 2 -1 0
1
end_operator
begin_operator
unstack pink pink robot1
1
3 0
4
0 7 0 1
0 8 -1 0
0 2 -1 0
0 1 0 1
1
end_operator
begin_operator
unstack pink purple robot1
0
5
0 3 0 1
0 5 1 0
0 7 0 1
0 8 -1 0
0 2 -1 0
1
end_operator
begin_operator
unstack pink red robot1
0
5
0 3 0 1
0 6 1 0
0 7 0 1
0 8 -1 0
0 2 -1 0
1
end_operator
begin_operator
unstack purple blue robot1
0
5
0 4 -1 0
0 5 0 2
0 7 0 1
0 8 -1 0
0 10 1 0
1
end_operator
begin_operator
unstack purple pink robot1
0
5
0 3 -1 0
0 5 0 2
0 7 0 1
0 8 -1 0
0 10 2 0
1
end_operator
begin_operator
unstack purple red robot1
0
5
0 5 0 2
0 6 -1 0
0 7 0 1
0 8 -1 0
0 10 3 0
1
end_operator
begin_operator
unstack red blue robot1
0
5
0 4 -1 0
0 6 0 2
0 7 0 1
0 8 -1 0
0 11 1 0
1
end_operator
begin_operator
unstack red pink robot1
0
5
0 3 -1 0
0 6 0 2
0 7 0 1
0 8 -1 0
0 11 2 0
1
end_operator
begin_operator
unstack red purple robot1
0
5
0 5 -1 0
0 6 0 2
0 7 0 1
0 8 -1 0
0 11 3 0
1
end_operator
0
