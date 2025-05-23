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
6
Atom holding(pink)
Atom on(pink, green)
Atom on(pink, purple)
Atom on(pink, red)
Atom on(pink, yellow)
Atom ontable(pink)
end_variable
begin_variable
var1
-1
6
Atom holding(purple)
Atom on(purple, green)
Atom on(purple, pink)
Atom on(purple, red)
Atom on(purple, yellow)
Atom ontable(purple)
end_variable
begin_variable
var2
-1
2
Atom clear(pink)
NegatedAtom clear(pink)
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
Atom clear(green)
NegatedAtom clear(green)
end_variable
begin_variable
var5
-1
2
Atom clear(red)
NegatedAtom clear(red)
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
6
Atom holding(green)
Atom on(green, pink)
Atom on(green, purple)
Atom on(green, red)
Atom on(green, yellow)
Atom ontable(green)
end_variable
begin_variable
var9
-1
6
Atom holding(red)
Atom on(red, green)
Atom on(red, pink)
Atom on(red, purple)
Atom on(red, yellow)
Atom ontable(red)
end_variable
begin_variable
var10
-1
6
Atom holding(yellow)
Atom on(yellow, green)
Atom on(yellow, pink)
Atom on(yellow, purple)
Atom on(yellow, red)
Atom ontable(yellow)
end_variable
6
begin_mutex_group
6
4 0
8 0
0 1
1 1
9 1
10 1
end_mutex_group
begin_mutex_group
6
2 0
8 1
0 0
1 2
9 2
10 2
end_mutex_group
begin_mutex_group
6
3 0
8 2
0 2
1 0
9 3
10 3
end_mutex_group
begin_mutex_group
6
5 0
8 3
0 3
1 3
9 0
10 4
end_mutex_group
begin_mutex_group
6
6 0
8 4
0 4
1 4
9 4
10 0
end_mutex_group
begin_mutex_group
6
7 0
8 0
0 0
1 0
9 0
10 0
end_mutex_group
begin_state
5
5
0
0
0
0
0
0
5
5
5
end_state
begin_goal
3
8 1
9 3
10 1
end_goal
50
begin_operator
pick-up green robot1
0
3
0 4 0 1
0 7 0 1
0 8 5 0
1
end_operator
begin_operator
pick-up pink robot1
0
3
0 2 0 1
0 7 0 1
0 0 5 0
1
end_operator
begin_operator
pick-up purple robot1
0
3
0 3 0 1
0 7 0 1
0 1 5 0
1
end_operator
begin_operator
pick-up red robot1
0
3
0 5 0 1
0 7 0 1
0 9 5 0
1
end_operator
begin_operator
pick-up yellow robot1
0
3
0 6 0 1
0 7 0 1
0 10 5 0
1
end_operator
begin_operator
put-down green robot1
0
3
0 4 -1 0
0 7 1 0
0 8 0 5
1
end_operator
begin_operator
put-down pink robot1
0
3
0 2 -1 0
0 7 1 0
0 0 0 5
1
end_operator
begin_operator
put-down purple robot1
0
3
0 3 -1 0
0 7 1 0
0 1 0 5
1
end_operator
begin_operator
put-down red robot1
0
3
0 5 -1 0
0 7 1 0
0 9 0 5
1
end_operator
begin_operator
put-down yellow robot1
0
3
0 6 -1 0
0 7 1 0
0 10 0 5
1
end_operator
begin_operator
stack green pink robot1
0
4
0 4 -1 0
0 2 0 1
0 7 1 0
0 8 0 1
1
end_operator
begin_operator
stack green purple robot1
0
4
0 4 -1 0
0 3 0 1
0 7 1 0
0 8 0 2
1
end_operator
begin_operator
stack green red robot1
0
4
0 4 -1 0
0 5 0 1
0 7 1 0
0 8 0 3
1
end_operator
begin_operator
stack green yellow robot1
0
4
0 4 -1 0
0 6 0 1
0 7 1 0
0 8 0 4
1
end_operator
begin_operator
stack pink green robot1
0
4
0 4 0 1
0 2 -1 0
0 7 1 0
0 0 0 1
1
end_operator
begin_operator
stack pink purple robot1
0
4
0 2 -1 0
0 3 0 1
0 7 1 0
0 0 0 2
1
end_operator
begin_operator
stack pink red robot1
0
4
0 2 -1 0
0 5 0 1
0 7 1 0
0 0 0 3
1
end_operator
begin_operator
stack pink yellow robot1
0
4
0 2 -1 0
0 6 0 1
0 7 1 0
0 0 0 4
1
end_operator
begin_operator
stack purple green robot1
0
4
0 4 0 1
0 3 -1 0
0 7 1 0
0 1 0 1
1
end_operator
begin_operator
stack purple pink robot1
0
4
0 2 0 1
0 3 -1 0
0 7 1 0
0 1 0 2
1
end_operator
begin_operator
stack purple red robot1
0
4
0 3 -1 0
0 5 0 1
0 7 1 0
0 1 0 3
1
end_operator
begin_operator
stack purple yellow robot1
0
4
0 3 -1 0
0 6 0 1
0 7 1 0
0 1 0 4
1
end_operator
begin_operator
stack red green robot1
0
4
0 4 0 1
0 5 -1 0
0 7 1 0
0 9 0 1
1
end_operator
begin_operator
stack red pink robot1
0
4
0 2 0 1
0 5 -1 0
0 7 1 0
0 9 0 2
1
end_operator
begin_operator
stack red purple robot1
0
4
0 3 0 1
0 5 -1 0
0 7 1 0
0 9 0 3
1
end_operator
begin_operator
stack red yellow robot1
0
4
0 5 -1 0
0 6 0 1
0 7 1 0
0 9 0 4
1
end_operator
begin_operator
stack yellow green robot1
0
4
0 4 0 1
0 6 -1 0
0 7 1 0
0 10 0 1
1
end_operator
begin_operator
stack yellow pink robot1
0
4
0 2 0 1
0 6 -1 0
0 7 1 0
0 10 0 2
1
end_operator
begin_operator
stack yellow purple robot1
0
4
0 3 0 1
0 6 -1 0
0 7 1 0
0 10 0 3
1
end_operator
begin_operator
stack yellow red robot1
0
4
0 5 0 1
0 6 -1 0
0 7 1 0
0 10 0 4
1
end_operator
begin_operator
unstack green pink robot1
0
4
0 4 0 1
0 2 -1 0
0 7 0 1
0 8 1 0
1
end_operator
begin_operator
unstack green purple robot1
0
4
0 4 0 1
0 3 -1 0
0 7 0 1
0 8 2 0
1
end_operator
begin_operator
unstack green red robot1
0
4
0 4 0 1
0 5 -1 0
0 7 0 1
0 8 3 0
1
end_operator
begin_operator
unstack green yellow robot1
0
4
0 4 0 1
0 6 -1 0
0 7 0 1
0 8 4 0
1
end_operator
begin_operator
unstack pink green robot1
0
4
0 4 -1 0
0 2 0 1
0 7 0 1
0 0 1 0
1
end_operator
begin_operator
unstack pink purple robot1
0
4
0 2 0 1
0 3 -1 0
0 7 0 1
0 0 2 0
1
end_operator
begin_operator
unstack pink red robot1
0
4
0 2 0 1
0 5 -1 0
0 7 0 1
0 0 3 0
1
end_operator
begin_operator
unstack pink yellow robot1
0
4
0 2 0 1
0 6 -1 0
0 7 0 1
0 0 4 0
1
end_operator
begin_operator
unstack purple green robot1
0
4
0 4 -1 0
0 3 0 1
0 7 0 1
0 1 1 0
1
end_operator
begin_operator
unstack purple pink robot1
0
4
0 2 -1 0
0 3 0 1
0 7 0 1
0 1 2 0
1
end_operator
begin_operator
unstack purple red robot1
0
4
0 3 0 1
0 5 -1 0
0 7 0 1
0 1 3 0
1
end_operator
begin_operator
unstack purple yellow robot1
0
4
0 3 0 1
0 6 -1 0
0 7 0 1
0 1 4 0
1
end_operator
begin_operator
unstack red green robot1
0
4
0 4 -1 0
0 5 0 1
0 7 0 1
0 9 1 0
1
end_operator
begin_operator
unstack red pink robot1
0
4
0 2 -1 0
0 5 0 1
0 7 0 1
0 9 2 0
1
end_operator
begin_operator
unstack red purple robot1
0
4
0 3 -1 0
0 5 0 1
0 7 0 1
0 9 3 0
1
end_operator
begin_operator
unstack red yellow robot1
0
4
0 5 0 1
0 6 -1 0
0 7 0 1
0 9 4 0
1
end_operator
begin_operator
unstack yellow green robot1
0
4
0 4 -1 0
0 6 0 1
0 7 0 1
0 10 1 0
1
end_operator
begin_operator
unstack yellow pink robot1
0
4
0 2 -1 0
0 6 0 1
0 7 0 1
0 10 2 0
1
end_operator
begin_operator
unstack yellow purple robot1
0
4
0 3 -1 0
0 6 0 1
0 7 0 1
0 10 3 0
1
end_operator
begin_operator
unstack yellow red robot1
0
4
0 5 -1 0
0 6 0 1
0 7 0 1
0 10 4 0
1
end_operator
0
