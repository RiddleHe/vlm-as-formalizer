begin_version
3
end_version
begin_metric
0
end_metric
13
begin_variable
var0
-1
7
Atom holding(red)
Atom on(red, blue)
Atom on(red, green)
Atom on(red, orange)
Atom on(red, purple)
Atom on(red, yellow)
Atom ontable(red)
end_variable
begin_variable
var1
-1
2
Atom clear(red)
NegatedAtom clear(red)
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
Atom clear(green)
NegatedAtom clear(green)
end_variable
begin_variable
var4
-1
2
Atom clear(orange)
NegatedAtom clear(orange)
end_variable
begin_variable
var5
-1
2
Atom clear(purple)
NegatedAtom clear(purple)
end_variable
begin_variable
var6
-1
2
Atom clear(yellow)
NegatedAtom clear(yellow)
end_variable
begin_variable
var7
-1
2
Atom handempty(robot1)
Atom handfull(robot1)
end_variable
begin_variable
var8
-1
7
Atom holding(blue)
Atom on(blue, green)
Atom on(blue, orange)
Atom on(blue, purple)
Atom on(blue, red)
Atom on(blue, yellow)
Atom ontable(blue)
end_variable
begin_variable
var9
-1
7
Atom holding(green)
Atom on(green, blue)
Atom on(green, orange)
Atom on(green, purple)
Atom on(green, red)
Atom on(green, yellow)
Atom ontable(green)
end_variable
begin_variable
var10
-1
7
Atom holding(orange)
Atom on(orange, blue)
Atom on(orange, green)
Atom on(orange, purple)
Atom on(orange, red)
Atom on(orange, yellow)
Atom ontable(orange)
end_variable
begin_variable
var11
-1
7
Atom holding(purple)
Atom on(purple, blue)
Atom on(purple, green)
Atom on(purple, orange)
Atom on(purple, red)
Atom on(purple, yellow)
Atom ontable(purple)
end_variable
begin_variable
var12
-1
7
Atom holding(yellow)
Atom on(yellow, blue)
Atom on(yellow, green)
Atom on(yellow, orange)
Atom on(yellow, purple)
Atom on(yellow, red)
Atom ontable(yellow)
end_variable
7
begin_mutex_group
7
2 0
8 0
9 1
10 1
11 1
0 1
12 1
end_mutex_group
begin_mutex_group
7
3 0
8 1
9 0
10 2
11 2
0 2
12 2
end_mutex_group
begin_mutex_group
7
4 0
8 2
9 2
10 0
11 3
0 3
12 3
end_mutex_group
begin_mutex_group
7
5 0
8 3
9 3
10 3
11 0
0 4
12 4
end_mutex_group
begin_mutex_group
7
1 0
8 4
9 4
10 4
11 4
0 0
12 5
end_mutex_group
begin_mutex_group
7
6 0
8 5
9 5
10 5
11 5
0 5
12 0
end_mutex_group
begin_mutex_group
7
7 0
8 0
9 0
10 0
11 0
0 0
12 0
end_mutex_group
begin_state
6
0
0
0
0
0
0
0
6
6
6
6
6
end_state
begin_goal
5
8 4
9 3
10 5
11 3
12 1
end_goal
72
begin_operator
pick-up blue robot1
0
3
0 2 0 1
0 7 0 1
0 8 6 0
1
end_operator
begin_operator
pick-up green robot1
0
3
0 3 0 1
0 7 0 1
0 9 6 0
1
end_operator
begin_operator
pick-up orange robot1
0
3
0 4 0 1
0 7 0 1
0 10 6 0
1
end_operator
begin_operator
pick-up purple robot1
0
3
0 5 0 1
0 7 0 1
0 11 6 0
1
end_operator
begin_operator
pick-up red robot1
0
3
0 1 0 1
0 7 0 1
0 0 6 0
1
end_operator
begin_operator
pick-up yellow robot1
0
3
0 6 0 1
0 7 0 1
0 12 6 0
1
end_operator
begin_operator
put-down blue robot1
0
3
0 2 -1 0
0 7 1 0
0 8 0 6
1
end_operator
begin_operator
put-down green robot1
0
3
0 3 -1 0
0 7 1 0
0 9 0 6
1
end_operator
begin_operator
put-down orange robot1
0
3
0 4 -1 0
0 7 1 0
0 10 0 6
1
end_operator
begin_operator
put-down purple robot1
0
3
0 5 -1 0
0 7 1 0
0 11 0 6
1
end_operator
begin_operator
put-down red robot1
0
3
0 1 -1 0
0 7 1 0
0 0 0 6
1
end_operator
begin_operator
put-down yellow robot1
0
3
0 6 -1 0
0 7 1 0
0 12 0 6
1
end_operator
begin_operator
stack blue green robot1
0
4
0 2 -1 0
0 3 0 1
0 7 1 0
0 8 0 1
1
end_operator
begin_operator
stack blue orange robot1
0
4
0 2 -1 0
0 4 0 1
0 7 1 0
0 8 0 2
1
end_operator
begin_operator
stack blue purple robot1
0
4
0 2 -1 0
0 5 0 1
0 7 1 0
0 8 0 3
1
end_operator
begin_operator
stack blue red robot1
0
4
0 2 -1 0
0 1 0 1
0 7 1 0
0 8 0 4
1
end_operator
begin_operator
stack blue yellow robot1
0
4
0 2 -1 0
0 6 0 1
0 7 1 0
0 8 0 5
1
end_operator
begin_operator
stack green blue robot1
0
4
0 2 0 1
0 3 -1 0
0 7 1 0
0 9 0 1
1
end_operator
begin_operator
stack green orange robot1
0
4
0 3 -1 0
0 4 0 1
0 7 1 0
0 9 0 2
1
end_operator
begin_operator
stack green purple robot1
0
4
0 3 -1 0
0 5 0 1
0 7 1 0
0 9 0 3
1
end_operator
begin_operator
stack green red robot1
0
4
0 3 -1 0
0 1 0 1
0 7 1 0
0 9 0 4
1
end_operator
begin_operator
stack green yellow robot1
0
4
0 3 -1 0
0 6 0 1
0 7 1 0
0 9 0 5
1
end_operator
begin_operator
stack orange blue robot1
0
4
0 2 0 1
0 4 -1 0
0 7 1 0
0 10 0 1
1
end_operator
begin_operator
stack orange green robot1
0
4
0 3 0 1
0 4 -1 0
0 7 1 0
0 10 0 2
1
end_operator
begin_operator
stack orange purple robot1
0
4
0 4 -1 0
0 5 0 1
0 7 1 0
0 10 0 3
1
end_operator
begin_operator
stack orange red robot1
0
4
0 4 -1 0
0 1 0 1
0 7 1 0
0 10 0 4
1
end_operator
begin_operator
stack orange yellow robot1
0
4
0 4 -1 0
0 6 0 1
0 7 1 0
0 10 0 5
1
end_operator
begin_operator
stack purple blue robot1
0
4
0 2 0 1
0 5 -1 0
0 7 1 0
0 11 0 1
1
end_operator
begin_operator
stack purple green robot1
0
4
0 3 0 1
0 5 -1 0
0 7 1 0
0 11 0 2
1
end_operator
begin_operator
stack purple orange robot1
0
4
0 4 0 1
0 5 -1 0
0 7 1 0
0 11 0 3
1
end_operator
begin_operator
stack purple red robot1
0
4
0 5 -1 0
0 1 0 1
0 7 1 0
0 11 0 4
1
end_operator
begin_operator
stack purple yellow robot1
0
4
0 5 -1 0
0 6 0 1
0 7 1 0
0 11 0 5
1
end_operator
begin_operator
stack red blue robot1
0
4
0 2 0 1
0 1 -1 0
0 7 1 0
0 0 0 1
1
end_operator
begin_operator
stack red green robot1
0
4
0 3 0 1
0 1 -1 0
0 7 1 0
0 0 0 2
1
end_operator
begin_operator
stack red orange robot1
0
4
0 4 0 1
0 1 -1 0
0 7 1 0
0 0 0 3
1
end_operator
begin_operator
stack red purple robot1
0
4
0 5 0 1
0 1 -1 0
0 7 1 0
0 0 0 4
1
end_operator
begin_operator
stack red yellow robot1
0
4
0 1 -1 0
0 6 0 1
0 7 1 0
0 0 0 5
1
end_operator
begin_operator
stack yellow blue robot1
0
4
0 2 0 1
0 6 -1 0
0 7 1 0
0 12 0 1
1
end_operator
begin_operator
stack yellow green robot1
0
4
0 3 0 1
0 6 -1 0
0 7 1 0
0 12 0 2
1
end_operator
begin_operator
stack yellow orange robot1
0
4
0 4 0 1
0 6 -1 0
0 7 1 0
0 12 0 3
1
end_operator
begin_operator
stack yellow purple robot1
0
4
0 5 0 1
0 6 -1 0
0 7 1 0
0 12 0 4
1
end_operator
begin_operator
stack yellow red robot1
0
4
0 1 0 1
0 6 -1 0
0 7 1 0
0 12 0 5
1
end_operator
begin_operator
unstack blue green robot1
0
4
0 2 0 1
0 3 -1 0
0 7 0 1
0 8 1 0
1
end_operator
begin_operator
unstack blue orange robot1
0
4
0 2 0 1
0 4 -1 0
0 7 0 1
0 8 2 0
1
end_operator
begin_operator
unstack blue purple robot1
0
4
0 2 0 1
0 5 -1 0
0 7 0 1
0 8 3 0
1
end_operator
begin_operator
unstack blue red robot1
0
4
0 2 0 1
0 1 -1 0
0 7 0 1
0 8 4 0
1
end_operator
begin_operator
unstack blue yellow robot1
0
4
0 2 0 1
0 6 -1 0
0 7 0 1
0 8 5 0
1
end_operator
begin_operator
unstack green blue robot1
0
4
0 2 -1 0
0 3 0 1
0 7 0 1
0 9 1 0
1
end_operator
begin_operator
unstack green orange robot1
0
4
0 3 0 1
0 4 -1 0
0 7 0 1
0 9 2 0
1
end_operator
begin_operator
unstack green purple robot1
0
4
0 3 0 1
0 5 -1 0
0 7 0 1
0 9 3 0
1
end_operator
begin_operator
unstack green red robot1
0
4
0 3 0 1
0 1 -1 0
0 7 0 1
0 9 4 0
1
end_operator
begin_operator
unstack green yellow robot1
0
4
0 3 0 1
0 6 -1 0
0 7 0 1
0 9 5 0
1
end_operator
begin_operator
unstack orange blue robot1
0
4
0 2 -1 0
0 4 0 1
0 7 0 1
0 10 1 0
1
end_operator
begin_operator
unstack orange green robot1
0
4
0 3 -1 0
0 4 0 1
0 7 0 1
0 10 2 0
1
end_operator
begin_operator
unstack orange purple robot1
0
4
0 4 0 1
0 5 -1 0
0 7 0 1
0 10 3 0
1
end_operator
begin_operator
unstack orange red robot1
0
4
0 4 0 1
0 1 -1 0
0 7 0 1
0 10 4 0
1
end_operator
begin_operator
unstack orange yellow robot1
0
4
0 4 0 1
0 6 -1 0
0 7 0 1
0 10 5 0
1
end_operator
begin_operator
unstack purple blue robot1
0
4
0 2 -1 0
0 5 0 1
0 7 0 1
0 11 1 0
1
end_operator
begin_operator
unstack purple green robot1
0
4
0 3 -1 0
0 5 0 1
0 7 0 1
0 11 2 0
1
end_operator
begin_operator
unstack purple orange robot1
0
4
0 4 -1 0
0 5 0 1
0 7 0 1
0 11 3 0
1
end_operator
begin_operator
unstack purple red robot1
0
4
0 5 0 1
0 1 -1 0
0 7 0 1
0 11 4 0
1
end_operator
begin_operator
unstack purple yellow robot1
0
4
0 5 0 1
0 6 -1 0
0 7 0 1
0 11 5 0
1
end_operator
begin_operator
unstack red blue robot1
0
4
0 2 -1 0
0 1 0 1
0 7 0 1
0 0 1 0
1
end_operator
begin_operator
unstack red green robot1
0
4
0 3 -1 0
0 1 0 1
0 7 0 1
0 0 2 0
1
end_operator
begin_operator
unstack red orange robot1
0
4
0 4 -1 0
0 1 0 1
0 7 0 1
0 0 3 0
1
end_operator
begin_operator
unstack red purple robot1
0
4
0 5 -1 0
0 1 0 1
0 7 0 1
0 0 4 0
1
end_operator
begin_operator
unstack red yellow robot1
0
4
0 1 0 1
0 6 -1 0
0 7 0 1
0 0 5 0
1
end_operator
begin_operator
unstack yellow blue robot1
0
4
0 2 -1 0
0 6 0 1
0 7 0 1
0 12 1 0
1
end_operator
begin_operator
unstack yellow green robot1
0
4
0 3 -1 0
0 6 0 1
0 7 0 1
0 12 2 0
1
end_operator
begin_operator
unstack yellow orange robot1
0
4
0 4 -1 0
0 6 0 1
0 7 0 1
0 12 3 0
1
end_operator
begin_operator
unstack yellow purple robot1
0
4
0 5 -1 0
0 6 0 1
0 7 0 1
0 12 4 0
1
end_operator
begin_operator
unstack yellow red robot1
0
4
0 1 -1 0
0 6 0 1
0 7 0 1
0 12 5 0
1
end_operator
0
