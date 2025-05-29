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
8
Atom holding(red)
Atom on(red, green)
Atom on(red, orange)
Atom on(red, pink)
Atom on(red, purple)
Atom on(red, red)
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
Atom clear(orange)
NegatedAtom clear(orange)
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
7
Atom holding(orange)
Atom on(orange, green)
Atom on(orange, pink)
Atom on(orange, purple)
Atom on(orange, red)
Atom on(orange, yellow)
Atom ontable(orange)
end_variable
begin_variable
var7
-1
7
Atom holding(pink)
Atom on(pink, green)
Atom on(pink, orange)
Atom on(pink, purple)
Atom on(pink, red)
Atom on(pink, yellow)
Atom ontable(pink)
end_variable
begin_variable
var8
-1
7
Atom holding(yellow)
Atom on(yellow, green)
Atom on(yellow, orange)
Atom on(yellow, pink)
Atom on(yellow, purple)
Atom on(yellow, red)
Atom ontable(yellow)
end_variable
begin_variable
var9
-1
7
Atom holding(green)
Atom on(green, orange)
Atom on(green, pink)
Atom on(green, purple)
Atom on(green, red)
Atom on(green, yellow)
Atom ontable(green)
end_variable
begin_variable
var10
-1
7
Atom holding(purple)
Atom on(purple, green)
Atom on(purple, orange)
Atom on(purple, pink)
Atom on(purple, red)
Atom on(purple, yellow)
Atom ontable(purple)
end_variable
begin_variable
var11
-1
2
Atom clear(green)
NegatedAtom clear(green)
end_variable
begin_variable
var12
-1
2
Atom clear(purple)
NegatedAtom clear(purple)
end_variable
6
begin_mutex_group
7
11 0
9 0
6 1
7 1
10 1
0 1
8 1
end_mutex_group
begin_mutex_group
7
2 0
9 1
6 0
7 2
10 2
0 2
8 2
end_mutex_group
begin_mutex_group
7
3 0
9 2
6 2
7 0
10 3
0 3
8 3
end_mutex_group
begin_mutex_group
7
12 0
9 3
6 3
7 3
10 0
0 4
8 4
end_mutex_group
begin_mutex_group
7
4 0
9 5
6 5
7 5
10 5
0 6
8 0
end_mutex_group
begin_mutex_group
7
5 0
9 0
6 0
7 0
10 0
0 0
8 0
end_mutex_group
begin_state
7
1
1
1
1
0
4
4
3
5
2
0
0
end_state
begin_goal
7
6 4
7 4
8 3
9 5
10 2
11 0
12 0
end_goal
74
begin_operator
pick-up green robot1
0
3
0 11 0 1
0 5 0 1
0 9 6 0
1
end_operator
begin_operator
pick-up orange robot1
0
3
0 2 0 1
0 5 0 1
0 6 6 0
1
end_operator
begin_operator
pick-up pink robot1
0
3
0 3 0 1
0 5 0 1
0 7 6 0
1
end_operator
begin_operator
pick-up purple robot1
0
3
0 12 0 1
0 5 0 1
0 10 6 0
1
end_operator
begin_operator
pick-up red robot1
0
3
0 1 0 1
0 5 0 1
0 0 7 0
1
end_operator
begin_operator
pick-up yellow robot1
0
3
0 4 0 1
0 5 0 1
0 8 6 0
1
end_operator
begin_operator
put-down green robot1
0
3
0 11 -1 0
0 5 1 0
0 9 0 6
1
end_operator
begin_operator
put-down orange robot1
0
3
0 2 -1 0
0 5 1 0
0 6 0 6
1
end_operator
begin_operator
put-down pink robot1
0
3
0 3 -1 0
0 5 1 0
0 7 0 6
1
end_operator
begin_operator
put-down purple robot1
0
3
0 12 -1 0
0 5 1 0
0 10 0 6
1
end_operator
begin_operator
put-down red robot1
0
3
0 1 -1 0
0 5 1 0
0 0 0 7
1
end_operator
begin_operator
put-down yellow robot1
0
3
0 4 -1 0
0 5 1 0
0 8 0 6
1
end_operator
begin_operator
stack green orange robot1
0
4
0 11 -1 0
0 2 0 1
0 5 1 0
0 9 0 1
1
end_operator
begin_operator
stack green pink robot1
0
4
0 11 -1 0
0 3 0 1
0 5 1 0
0 9 0 2
1
end_operator
begin_operator
stack green purple robot1
0
4
0 11 -1 0
0 12 0 1
0 5 1 0
0 9 0 3
1
end_operator
begin_operator
stack green red robot1
0
4
0 11 -1 0
0 1 0 1
0 5 1 0
0 9 0 4
1
end_operator
begin_operator
stack green yellow robot1
0
4
0 11 -1 0
0 4 0 1
0 5 1 0
0 9 0 5
1
end_operator
begin_operator
stack orange green robot1
0
4
0 11 0 1
0 2 -1 0
0 5 1 0
0 6 0 1
1
end_operator
begin_operator
stack orange pink robot1
0
4
0 2 -1 0
0 3 0 1
0 5 1 0
0 6 0 2
1
end_operator
begin_operator
stack orange purple robot1
0
4
0 2 -1 0
0 12 0 1
0 5 1 0
0 6 0 3
1
end_operator
begin_operator
stack orange red robot1
0
4
0 2 -1 0
0 1 0 1
0 5 1 0
0 6 0 4
1
end_operator
begin_operator
stack orange yellow robot1
0
4
0 2 -1 0
0 4 0 1
0 5 1 0
0 6 0 5
1
end_operator
begin_operator
stack pink green robot1
0
4
0 11 0 1
0 3 -1 0
0 5 1 0
0 7 0 1
1
end_operator
begin_operator
stack pink orange robot1
0
4
0 2 0 1
0 3 -1 0
0 5 1 0
0 7 0 2
1
end_operator
begin_operator
stack pink purple robot1
0
4
0 3 -1 0
0 12 0 1
0 5 1 0
0 7 0 3
1
end_operator
begin_operator
stack pink red robot1
0
4
0 3 -1 0
0 1 0 1
0 5 1 0
0 7 0 4
1
end_operator
begin_operator
stack pink yellow robot1
0
4
0 3 -1 0
0 4 0 1
0 5 1 0
0 7 0 5
1
end_operator
begin_operator
stack purple green robot1
0
4
0 11 0 1
0 12 -1 0
0 5 1 0
0 10 0 1
1
end_operator
begin_operator
stack purple orange robot1
0
4
0 2 0 1
0 12 -1 0
0 5 1 0
0 10 0 2
1
end_operator
begin_operator
stack purple pink robot1
0
4
0 3 0 1
0 12 -1 0
0 5 1 0
0 10 0 3
1
end_operator
begin_operator
stack purple red robot1
0
4
0 12 -1 0
0 1 0 1
0 5 1 0
0 10 0 4
1
end_operator
begin_operator
stack purple yellow robot1
0
4
0 12 -1 0
0 4 0 1
0 5 1 0
0 10 0 5
1
end_operator
begin_operator
stack red green robot1
0
4
0 11 0 1
0 1 -1 0
0 5 1 0
0 0 0 1
1
end_operator
begin_operator
stack red orange robot1
0
4
0 2 0 1
0 1 -1 0
0 5 1 0
0 0 0 2
1
end_operator
begin_operator
stack red pink robot1
0
4
0 3 0 1
0 1 -1 0
0 5 1 0
0 0 0 3
1
end_operator
begin_operator
stack red purple robot1
0
4
0 12 0 1
0 1 -1 0
0 5 1 0
0 0 0 4
1
end_operator
begin_operator
stack red red robot1
1
1 0
2
0 5 1 0
0 0 0 5
1
end_operator
begin_operator
stack red yellow robot1
0
4
0 1 -1 0
0 4 0 1
0 5 1 0
0 0 0 6
1
end_operator
begin_operator
stack yellow green robot1
0
4
0 11 0 1
0 4 -1 0
0 5 1 0
0 8 0 1
1
end_operator
begin_operator
stack yellow orange robot1
0
4
0 2 0 1
0 4 -1 0
0 5 1 0
0 8 0 2
1
end_operator
begin_operator
stack yellow pink robot1
0
4
0 3 0 1
0 4 -1 0
0 5 1 0
0 8 0 3
1
end_operator
begin_operator
stack yellow purple robot1
0
4
0 12 0 1
0 4 -1 0
0 5 1 0
0 8 0 4
1
end_operator
begin_operator
stack yellow red robot1
0
4
0 1 0 1
0 4 -1 0
0 5 1 0
0 8 0 5
1
end_operator
begin_operator
unstack green orange robot1
0
4
0 11 0 1
0 2 -1 0
0 5 0 1
0 9 1 0
1
end_operator
begin_operator
unstack green pink robot1
0
4
0 11 0 1
0 3 -1 0
0 5 0 1
0 9 2 0
1
end_operator
begin_operator
unstack green purple robot1
0
4
0 11 0 1
0 12 -1 0
0 5 0 1
0 9 3 0
1
end_operator
begin_operator
unstack green red robot1
0
4
0 11 0 1
0 1 -1 0
0 5 0 1
0 9 4 0
1
end_operator
begin_operator
unstack green yellow robot1
0
4
0 11 0 1
0 4 -1 0
0 5 0 1
0 9 5 0
1
end_operator
begin_operator
unstack orange green robot1
0
4
0 11 -1 0
0 2 0 1
0 5 0 1
0 6 1 0
1
end_operator
begin_operator
unstack orange pink robot1
0
4
0 2 0 1
0 3 -1 0
0 5 0 1
0 6 2 0
1
end_operator
begin_operator
unstack orange purple robot1
0
4
0 2 0 1
0 12 -1 0
0 5 0 1
0 6 3 0
1
end_operator
begin_operator
unstack orange red robot1
0
4
0 2 0 1
0 1 -1 0
0 5 0 1
0 6 4 0
1
end_operator
begin_operator
unstack orange yellow robot1
0
4
0 2 0 1
0 4 -1 0
0 5 0 1
0 6 5 0
1
end_operator
begin_operator
unstack pink green robot1
0
4
0 11 -1 0
0 3 0 1
0 5 0 1
0 7 1 0
1
end_operator
begin_operator
unstack pink orange robot1
0
4
0 2 -1 0
0 3 0 1
0 5 0 1
0 7 2 0
1
end_operator
begin_operator
unstack pink purple robot1
0
4
0 3 0 1
0 12 -1 0
0 5 0 1
0 7 3 0
1
end_operator
begin_operator
unstack pink red robot1
0
4
0 3 0 1
0 1 -1 0
0 5 0 1
0 7 4 0
1
end_operator
begin_operator
unstack pink yellow robot1
0
4
0 3 0 1
0 4 -1 0
0 5 0 1
0 7 5 0
1
end_operator
begin_operator
unstack purple green robot1
0
4
0 11 -1 0
0 12 0 1
0 5 0 1
0 10 1 0
1
end_operator
begin_operator
unstack purple orange robot1
0
4
0 2 -1 0
0 12 0 1
0 5 0 1
0 10 2 0
1
end_operator
begin_operator
unstack purple pink robot1
0
4
0 3 -1 0
0 12 0 1
0 5 0 1
0 10 3 0
1
end_operator
begin_operator
unstack purple red robot1
0
4
0 12 0 1
0 1 -1 0
0 5 0 1
0 10 4 0
1
end_operator
begin_operator
unstack purple yellow robot1
0
4
0 12 0 1
0 4 -1 0
0 5 0 1
0 10 5 0
1
end_operator
begin_operator
unstack red green robot1
0
4
0 11 -1 0
0 1 0 1
0 5 0 1
0 0 1 0
1
end_operator
begin_operator
unstack red orange robot1
0
4
0 2 -1 0
0 1 0 1
0 5 0 1
0 0 2 0
1
end_operator
begin_operator
unstack red pink robot1
0
4
0 3 -1 0
0 1 0 1
0 5 0 1
0 0 3 0
1
end_operator
begin_operator
unstack red purple robot1
0
4
0 12 -1 0
0 1 0 1
0 5 0 1
0 0 4 0
1
end_operator
begin_operator
unstack red red robot1
1
1 0
2
0 5 0 1
0 0 5 0
1
end_operator
begin_operator
unstack red yellow robot1
0
4
0 1 0 1
0 4 -1 0
0 5 0 1
0 0 6 0
1
end_operator
begin_operator
unstack yellow green robot1
0
4
0 11 -1 0
0 4 0 1
0 5 0 1
0 8 1 0
1
end_operator
begin_operator
unstack yellow orange robot1
0
4
0 2 -1 0
0 4 0 1
0 5 0 1
0 8 2 0
1
end_operator
begin_operator
unstack yellow pink robot1
0
4
0 3 -1 0
0 4 0 1
0 5 0 1
0 8 3 0
1
end_operator
begin_operator
unstack yellow purple robot1
0
4
0 12 -1 0
0 4 0 1
0 5 0 1
0 8 4 0
1
end_operator
begin_operator
unstack yellow red robot1
0
4
0 1 -1 0
0 4 0 1
0 5 0 1
0 8 5 0
1
end_operator
0
