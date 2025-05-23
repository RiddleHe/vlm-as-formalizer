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
Atom clear(red)
NegatedAtom clear(red)
end_variable
begin_variable
var1
-1
2
Atom clear(blue)
NegatedAtom clear(blue)
end_variable
begin_variable
var2
-1
2
Atom clear(orange)
NegatedAtom clear(orange)
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
Atom clear(yellow)
NegatedAtom clear(yellow)
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
6
Atom holding(blue)
Atom on(blue, orange)
Atom on(blue, purple)
Atom on(blue, red)
Atom on(blue, yellow)
Atom ontable(blue)
end_variable
begin_variable
var7
-1
6
Atom holding(orange)
Atom on(orange, blue)
Atom on(orange, purple)
Atom on(orange, red)
Atom on(orange, yellow)
Atom ontable(orange)
end_variable
begin_variable
var8
-1
6
Atom holding(purple)
Atom on(purple, blue)
Atom on(purple, orange)
Atom on(purple, red)
Atom on(purple, yellow)
Atom ontable(purple)
end_variable
begin_variable
var9
-1
6
Atom holding(yellow)
Atom on(yellow, blue)
Atom on(yellow, orange)
Atom on(yellow, purple)
Atom on(yellow, red)
Atom ontable(yellow)
end_variable
6
begin_mutex_group
5
1 0
6 0
7 1
8 1
9 1
end_mutex_group
begin_mutex_group
5
2 0
6 1
7 0
8 2
9 2
end_mutex_group
begin_mutex_group
5
3 0
6 2
7 2
8 0
9 3
end_mutex_group
begin_mutex_group
5
0 0
6 3
7 3
8 3
9 4
end_mutex_group
begin_mutex_group
5
4 0
6 4
7 4
8 4
9 0
end_mutex_group
begin_mutex_group
5
5 0
6 0
7 0
8 0
9 0
end_mutex_group
begin_state
1
0
0
0
0
0
5
5
3
5
end_state
begin_goal
4
6 2
7 4
8 3
9 1
end_goal
40
begin_operator
pick-up blue robot1
0
3
0 1 0 1
0 5 0 1
0 6 5 0
1
end_operator
begin_operator
pick-up orange robot1
0
3
0 2 0 1
0 5 0 1
0 7 5 0
1
end_operator
begin_operator
pick-up purple robot1
0
3
0 3 0 1
0 5 0 1
0 8 5 0
1
end_operator
begin_operator
pick-up yellow robot1
0
3
0 4 0 1
0 5 0 1
0 9 5 0
1
end_operator
begin_operator
put-down blue robot1
0
3
0 1 -1 0
0 5 1 0
0 6 0 5
1
end_operator
begin_operator
put-down orange robot1
0
3
0 2 -1 0
0 5 1 0
0 7 0 5
1
end_operator
begin_operator
put-down purple robot1
0
3
0 3 -1 0
0 5 1 0
0 8 0 5
1
end_operator
begin_operator
put-down yellow robot1
0
3
0 4 -1 0
0 5 1 0
0 9 0 5
1
end_operator
begin_operator
stack blue orange robot1
0
4
0 1 -1 0
0 2 0 1
0 5 1 0
0 6 0 1
1
end_operator
begin_operator
stack blue purple robot1
0
4
0 1 -1 0
0 3 0 1
0 5 1 0
0 6 0 2
1
end_operator
begin_operator
stack blue red robot1
0
4
0 1 -1 0
0 0 0 1
0 5 1 0
0 6 0 3
1
end_operator
begin_operator
stack blue yellow robot1
0
4
0 1 -1 0
0 4 0 1
0 5 1 0
0 6 0 4
1
end_operator
begin_operator
stack orange blue robot1
0
4
0 1 0 1
0 2 -1 0
0 5 1 0
0 7 0 1
1
end_operator
begin_operator
stack orange purple robot1
0
4
0 2 -1 0
0 3 0 1
0 5 1 0
0 7 0 2
1
end_operator
begin_operator
stack orange red robot1
0
4
0 2 -1 0
0 0 0 1
0 5 1 0
0 7 0 3
1
end_operator
begin_operator
stack orange yellow robot1
0
4
0 2 -1 0
0 4 0 1
0 5 1 0
0 7 0 4
1
end_operator
begin_operator
stack purple blue robot1
0
4
0 1 0 1
0 3 -1 0
0 5 1 0
0 8 0 1
1
end_operator
begin_operator
stack purple orange robot1
0
4
0 2 0 1
0 3 -1 0
0 5 1 0
0 8 0 2
1
end_operator
begin_operator
stack purple red robot1
0
4
0 3 -1 0
0 0 0 1
0 5 1 0
0 8 0 3
1
end_operator
begin_operator
stack purple yellow robot1
0
4
0 3 -1 0
0 4 0 1
0 5 1 0
0 8 0 4
1
end_operator
begin_operator
stack yellow blue robot1
0
4
0 1 0 1
0 4 -1 0
0 5 1 0
0 9 0 1
1
end_operator
begin_operator
stack yellow orange robot1
0
4
0 2 0 1
0 4 -1 0
0 5 1 0
0 9 0 2
1
end_operator
begin_operator
stack yellow purple robot1
0
4
0 3 0 1
0 4 -1 0
0 5 1 0
0 9 0 3
1
end_operator
begin_operator
stack yellow red robot1
0
4
0 0 0 1
0 4 -1 0
0 5 1 0
0 9 0 4
1
end_operator
begin_operator
unstack blue orange robot1
0
4
0 1 0 1
0 2 -1 0
0 5 0 1
0 6 1 0
1
end_operator
begin_operator
unstack blue purple robot1
0
4
0 1 0 1
0 3 -1 0
0 5 0 1
0 6 2 0
1
end_operator
begin_operator
unstack blue red robot1
0
4
0 1 0 1
0 0 -1 0
0 5 0 1
0 6 3 0
1
end_operator
begin_operator
unstack blue yellow robot1
0
4
0 1 0 1
0 4 -1 0
0 5 0 1
0 6 4 0
1
end_operator
begin_operator
unstack orange blue robot1
0
4
0 1 -1 0
0 2 0 1
0 5 0 1
0 7 1 0
1
end_operator
begin_operator
unstack orange purple robot1
0
4
0 2 0 1
0 3 -1 0
0 5 0 1
0 7 2 0
1
end_operator
begin_operator
unstack orange red robot1
0
4
0 2 0 1
0 0 -1 0
0 5 0 1
0 7 3 0
1
end_operator
begin_operator
unstack orange yellow robot1
0
4
0 2 0 1
0 4 -1 0
0 5 0 1
0 7 4 0
1
end_operator
begin_operator
unstack purple blue robot1
0
4
0 1 -1 0
0 3 0 1
0 5 0 1
0 8 1 0
1
end_operator
begin_operator
unstack purple orange robot1
0
4
0 2 -1 0
0 3 0 1
0 5 0 1
0 8 2 0
1
end_operator
begin_operator
unstack purple red robot1
0
4
0 3 0 1
0 0 -1 0
0 5 0 1
0 8 3 0
1
end_operator
begin_operator
unstack purple yellow robot1
0
4
0 3 0 1
0 4 -1 0
0 5 0 1
0 8 4 0
1
end_operator
begin_operator
unstack yellow blue robot1
0
4
0 1 -1 0
0 4 0 1
0 5 0 1
0 9 1 0
1
end_operator
begin_operator
unstack yellow orange robot1
0
4
0 2 -1 0
0 4 0 1
0 5 0 1
0 9 2 0
1
end_operator
begin_operator
unstack yellow purple robot1
0
4
0 3 -1 0
0 4 0 1
0 5 0 1
0 9 3 0
1
end_operator
begin_operator
unstack yellow red robot1
0
4
0 0 -1 0
0 4 0 1
0 5 0 1
0 9 4 0
1
end_operator
0
