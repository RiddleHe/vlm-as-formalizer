begin_version
3
end_version
begin_metric
0
end_metric
15
begin_variable
var0
-1
8
Atom holding(blue)
Atom on(blue, green)
Atom on(blue, orange)
Atom on(blue, pink)
Atom on(blue, purple)
Atom on(blue, red)
Atom on(blue, yellow)
Atom ontable(blue)
end_variable
begin_variable
var1
-1
8
Atom holding(orange)
Atom on(orange, blue)
Atom on(orange, green)
Atom on(orange, pink)
Atom on(orange, purple)
Atom on(orange, red)
Atom on(orange, yellow)
Atom ontable(orange)
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
Atom clear(orange)
NegatedAtom clear(orange)
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
Atom clear(pink)
NegatedAtom clear(pink)
end_variable
begin_variable
var6
-1
2
Atom clear(purple)
NegatedAtom clear(purple)
end_variable
begin_variable
var7
-1
2
Atom clear(red)
NegatedAtom clear(red)
end_variable
begin_variable
var8
-1
2
Atom clear(yellow)
NegatedAtom clear(yellow)
end_variable
begin_variable
var9
-1
2
Atom handempty(robot1)
Atom handfull(robot1)
end_variable
begin_variable
var10
-1
8
Atom holding(green)
Atom on(green, blue)
Atom on(green, orange)
Atom on(green, pink)
Atom on(green, purple)
Atom on(green, red)
Atom on(green, yellow)
Atom ontable(green)
end_variable
begin_variable
var11
-1
8
Atom holding(pink)
Atom on(pink, blue)
Atom on(pink, green)
Atom on(pink, orange)
Atom on(pink, purple)
Atom on(pink, red)
Atom on(pink, yellow)
Atom ontable(pink)
end_variable
begin_variable
var12
-1
8
Atom holding(purple)
Atom on(purple, blue)
Atom on(purple, green)
Atom on(purple, orange)
Atom on(purple, pink)
Atom on(purple, red)
Atom on(purple, yellow)
Atom ontable(purple)
end_variable
begin_variable
var13
-1
8
Atom holding(red)
Atom on(red, blue)
Atom on(red, green)
Atom on(red, orange)
Atom on(red, pink)
Atom on(red, purple)
Atom on(red, yellow)
Atom ontable(red)
end_variable
begin_variable
var14
-1
8
Atom holding(yellow)
Atom on(yellow, blue)
Atom on(yellow, green)
Atom on(yellow, orange)
Atom on(yellow, pink)
Atom on(yellow, purple)
Atom on(yellow, red)
Atom ontable(yellow)
end_variable
8
begin_mutex_group
8
2 0
0 0
10 1
1 1
11 1
12 1
13 1
14 1
end_mutex_group
begin_mutex_group
8
4 0
0 1
10 0
1 2
11 2
12 2
13 2
14 2
end_mutex_group
begin_mutex_group
8
3 0
0 2
10 2
1 0
11 3
12 3
13 3
14 3
end_mutex_group
begin_mutex_group
8
5 0
0 3
10 3
1 3
11 0
12 4
13 4
14 4
end_mutex_group
begin_mutex_group
8
6 0
0 4
10 4
1 4
11 4
12 0
13 5
14 5
end_mutex_group
begin_mutex_group
8
7 0
0 5
10 5
1 5
11 5
12 5
13 0
14 6
end_mutex_group
begin_mutex_group
8
8 0
0 6
10 6
1 6
11 6
12 6
13 6
14 0
end_mutex_group
begin_mutex_group
8
9 0
0 0
10 0
1 0
11 0
12 0
13 0
14 0
end_mutex_group
begin_state
7
7
0
0
1
1
1
0
0
0
7
2
7
5
4
end_state
begin_goal
5
10 5
11 2
12 1
13 5
14 4
end_goal
98
begin_operator
pick-up blue robot1
0
3
0 2 0 1
0 9 0 1
0 0 7 0
1
end_operator
begin_operator
pick-up green robot1
0
3
0 4 0 1
0 9 0 1
0 10 7 0
1
end_operator
begin_operator
pick-up orange robot1
0
3
0 3 0 1
0 9 0 1
0 1 7 0
1
end_operator
begin_operator
pick-up pink robot1
0
3
0 5 0 1
0 9 0 1
0 11 7 0
1
end_operator
begin_operator
pick-up purple robot1
0
3
0 6 0 1
0 9 0 1
0 12 7 0
1
end_operator
begin_operator
pick-up red robot1
0
3
0 7 0 1
0 9 0 1
0 13 7 0
1
end_operator
begin_operator
pick-up yellow robot1
0
3
0 8 0 1
0 9 0 1
0 14 7 0
1
end_operator
begin_operator
put-down blue robot1
0
3
0 2 -1 0
0 9 1 0
0 0 0 7
1
end_operator
begin_operator
put-down green robot1
0
3
0 4 -1 0
0 9 1 0
0 10 0 7
1
end_operator
begin_operator
put-down orange robot1
0
3
0 3 -1 0
0 9 1 0
0 1 0 7
1
end_operator
begin_operator
put-down pink robot1
0
3
0 5 -1 0
0 9 1 0
0 11 0 7
1
end_operator
begin_operator
put-down purple robot1
0
3
0 6 -1 0
0 9 1 0
0 12 0 7
1
end_operator
begin_operator
put-down red robot1
0
3
0 7 -1 0
0 9 1 0
0 13 0 7
1
end_operator
begin_operator
put-down yellow robot1
0
3
0 8 -1 0
0 9 1 0
0 14 0 7
1
end_operator
begin_operator
stack blue green robot1
0
4
0 2 -1 0
0 4 0 1
0 9 1 0
0 0 0 1
1
end_operator
begin_operator
stack blue orange robot1
0
4
0 2 -1 0
0 3 0 1
0 9 1 0
0 0 0 2
1
end_operator
begin_operator
stack blue pink robot1
0
4
0 2 -1 0
0 5 0 1
0 9 1 0
0 0 0 3
1
end_operator
begin_operator
stack blue purple robot1
0
4
0 2 -1 0
0 6 0 1
0 9 1 0
0 0 0 4
1
end_operator
begin_operator
stack blue red robot1
0
4
0 2 -1 0
0 7 0 1
0 9 1 0
0 0 0 5
1
end_operator
begin_operator
stack blue yellow robot1
0
4
0 2 -1 0
0 8 0 1
0 9 1 0
0 0 0 6
1
end_operator
begin_operator
stack green blue robot1
0
4
0 2 0 1
0 4 -1 0
0 9 1 0
0 10 0 1
1
end_operator
begin_operator
stack green orange robot1
0
4
0 4 -1 0
0 3 0 1
0 9 1 0
0 10 0 2
1
end_operator
begin_operator
stack green pink robot1
0
4
0 4 -1 0
0 5 0 1
0 9 1 0
0 10 0 3
1
end_operator
begin_operator
stack green purple robot1
0
4
0 4 -1 0
0 6 0 1
0 9 1 0
0 10 0 4
1
end_operator
begin_operator
stack green red robot1
0
4
0 4 -1 0
0 7 0 1
0 9 1 0
0 10 0 5
1
end_operator
begin_operator
stack green yellow robot1
0
4
0 4 -1 0
0 8 0 1
0 9 1 0
0 10 0 6
1
end_operator
begin_operator
stack orange blue robot1
0
4
0 2 0 1
0 3 -1 0
0 9 1 0
0 1 0 1
1
end_operator
begin_operator
stack orange green robot1
0
4
0 4 0 1
0 3 -1 0
0 9 1 0
0 1 0 2
1
end_operator
begin_operator
stack orange pink robot1
0
4
0 3 -1 0
0 5 0 1
0 9 1 0
0 1 0 3
1
end_operator
begin_operator
stack orange purple robot1
0
4
0 3 -1 0
0 6 0 1
0 9 1 0
0 1 0 4
1
end_operator
begin_operator
stack orange red robot1
0
4
0 3 -1 0
0 7 0 1
0 9 1 0
0 1 0 5
1
end_operator
begin_operator
stack orange yellow robot1
0
4
0 3 -1 0
0 8 0 1
0 9 1 0
0 1 0 6
1
end_operator
begin_operator
stack pink blue robot1
0
4
0 2 0 1
0 5 -1 0
0 9 1 0
0 11 0 1
1
end_operator
begin_operator
stack pink green robot1
0
4
0 4 0 1
0 5 -1 0
0 9 1 0
0 11 0 2
1
end_operator
begin_operator
stack pink orange robot1
0
4
0 3 0 1
0 5 -1 0
0 9 1 0
0 11 0 3
1
end_operator
begin_operator
stack pink purple robot1
0
4
0 5 -1 0
0 6 0 1
0 9 1 0
0 11 0 4
1
end_operator
begin_operator
stack pink red robot1
0
4
0 5 -1 0
0 7 0 1
0 9 1 0
0 11 0 5
1
end_operator
begin_operator
stack pink yellow robot1
0
4
0 5 -1 0
0 8 0 1
0 9 1 0
0 11 0 6
1
end_operator
begin_operator
stack purple blue robot1
0
4
0 2 0 1
0 6 -1 0
0 9 1 0
0 12 0 1
1
end_operator
begin_operator
stack purple green robot1
0
4
0 4 0 1
0 6 -1 0
0 9 1 0
0 12 0 2
1
end_operator
begin_operator
stack purple orange robot1
0
4
0 3 0 1
0 6 -1 0
0 9 1 0
0 12 0 3
1
end_operator
begin_operator
stack purple pink robot1
0
4
0 5 0 1
0 6 -1 0
0 9 1 0
0 12 0 4
1
end_operator
begin_operator
stack purple red robot1
0
4
0 6 -1 0
0 7 0 1
0 9 1 0
0 12 0 5
1
end_operator
begin_operator
stack purple yellow robot1
0
4
0 6 -1 0
0 8 0 1
0 9 1 0
0 12 0 6
1
end_operator
begin_operator
stack red blue robot1
0
4
0 2 0 1
0 7 -1 0
0 9 1 0
0 13 0 1
1
end_operator
begin_operator
stack red green robot1
0
4
0 4 0 1
0 7 -1 0
0 9 1 0
0 13 0 2
1
end_operator
begin_operator
stack red orange robot1
0
4
0 3 0 1
0 7 -1 0
0 9 1 0
0 13 0 3
1
end_operator
begin_operator
stack red pink robot1
0
4
0 5 0 1
0 7 -1 0
0 9 1 0
0 13 0 4
1
end_operator
begin_operator
stack red purple robot1
0
4
0 6 0 1
0 7 -1 0
0 9 1 0
0 13 0 5
1
end_operator
begin_operator
stack red yellow robot1
0
4
0 7 -1 0
0 8 0 1
0 9 1 0
0 13 0 6
1
end_operator
begin_operator
stack yellow blue robot1
0
4
0 2 0 1
0 8 -1 0
0 9 1 0
0 14 0 1
1
end_operator
begin_operator
stack yellow green robot1
0
4
0 4 0 1
0 8 -1 0
0 9 1 0
0 14 0 2
1
end_operator
begin_operator
stack yellow orange robot1
0
4
0 3 0 1
0 8 -1 0
0 9 1 0
0 14 0 3
1
end_operator
begin_operator
stack yellow pink robot1
0
4
0 5 0 1
0 8 -1 0
0 9 1 0
0 14 0 4
1
end_operator
begin_operator
stack yellow purple robot1
0
4
0 6 0 1
0 8 -1 0
0 9 1 0
0 14 0 5
1
end_operator
begin_operator
stack yellow red robot1
0
4
0 7 0 1
0 8 -1 0
0 9 1 0
0 14 0 6
1
end_operator
begin_operator
unstack blue green robot1
0
4
0 2 0 1
0 4 -1 0
0 9 0 1
0 0 1 0
1
end_operator
begin_operator
unstack blue orange robot1
0
4
0 2 0 1
0 3 -1 0
0 9 0 1
0 0 2 0
1
end_operator
begin_operator
unstack blue pink robot1
0
4
0 2 0 1
0 5 -1 0
0 9 0 1
0 0 3 0
1
end_operator
begin_operator
unstack blue purple robot1
0
4
0 2 0 1
0 6 -1 0
0 9 0 1
0 0 4 0
1
end_operator
begin_operator
unstack blue red robot1
0
4
0 2 0 1
0 7 -1 0
0 9 0 1
0 0 5 0
1
end_operator
begin_operator
unstack blue yellow robot1
0
4
0 2 0 1
0 8 -1 0
0 9 0 1
0 0 6 0
1
end_operator
begin_operator
unstack green blue robot1
0
4
0 2 -1 0
0 4 0 1
0 9 0 1
0 10 1 0
1
end_operator
begin_operator
unstack green orange robot1
0
4
0 4 0 1
0 3 -1 0
0 9 0 1
0 10 2 0
1
end_operator
begin_operator
unstack green pink robot1
0
4
0 4 0 1
0 5 -1 0
0 9 0 1
0 10 3 0
1
end_operator
begin_operator
unstack green purple robot1
0
4
0 4 0 1
0 6 -1 0
0 9 0 1
0 10 4 0
1
end_operator
begin_operator
unstack green red robot1
0
4
0 4 0 1
0 7 -1 0
0 9 0 1
0 10 5 0
1
end_operator
begin_operator
unstack green yellow robot1
0
4
0 4 0 1
0 8 -1 0
0 9 0 1
0 10 6 0
1
end_operator
begin_operator
unstack orange blue robot1
0
4
0 2 -1 0
0 3 0 1
0 9 0 1
0 1 1 0
1
end_operator
begin_operator
unstack orange green robot1
0
4
0 4 -1 0
0 3 0 1
0 9 0 1
0 1 2 0
1
end_operator
begin_operator
unstack orange pink robot1
0
4
0 3 0 1
0 5 -1 0
0 9 0 1
0 1 3 0
1
end_operator
begin_operator
unstack orange purple robot1
0
4
0 3 0 1
0 6 -1 0
0 9 0 1
0 1 4 0
1
end_operator
begin_operator
unstack orange red robot1
0
4
0 3 0 1
0 7 -1 0
0 9 0 1
0 1 5 0
1
end_operator
begin_operator
unstack orange yellow robot1
0
4
0 3 0 1
0 8 -1 0
0 9 0 1
0 1 6 0
1
end_operator
begin_operator
unstack pink blue robot1
0
4
0 2 -1 0
0 5 0 1
0 9 0 1
0 11 1 0
1
end_operator
begin_operator
unstack pink green robot1
0
4
0 4 -1 0
0 5 0 1
0 9 0 1
0 11 2 0
1
end_operator
begin_operator
unstack pink orange robot1
0
4
0 3 -1 0
0 5 0 1
0 9 0 1
0 11 3 0
1
end_operator
begin_operator
unstack pink purple robot1
0
4
0 5 0 1
0 6 -1 0
0 9 0 1
0 11 4 0
1
end_operator
begin_operator
unstack pink red robot1
0
4
0 5 0 1
0 7 -1 0
0 9 0 1
0 11 5 0
1
end_operator
begin_operator
unstack pink yellow robot1
0
4
0 5 0 1
0 8 -1 0
0 9 0 1
0 11 6 0
1
end_operator
begin_operator
unstack purple blue robot1
0
4
0 2 -1 0
0 6 0 1
0 9 0 1
0 12 1 0
1
end_operator
begin_operator
unstack purple green robot1
0
4
0 4 -1 0
0 6 0 1
0 9 0 1
0 12 2 0
1
end_operator
begin_operator
unstack purple orange robot1
0
4
0 3 -1 0
0 6 0 1
0 9 0 1
0 12 3 0
1
end_operator
begin_operator
unstack purple pink robot1
0
4
0 5 -1 0
0 6 0 1
0 9 0 1
0 12 4 0
1
end_operator
begin_operator
unstack purple red robot1
0
4
0 6 0 1
0 7 -1 0
0 9 0 1
0 12 5 0
1
end_operator
begin_operator
unstack purple yellow robot1
0
4
0 6 0 1
0 8 -1 0
0 9 0 1
0 12 6 0
1
end_operator
begin_operator
unstack red blue robot1
0
4
0 2 -1 0
0 7 0 1
0 9 0 1
0 13 1 0
1
end_operator
begin_operator
unstack red green robot1
0
4
0 4 -1 0
0 7 0 1
0 9 0 1
0 13 2 0
1
end_operator
begin_operator
unstack red orange robot1
0
4
0 3 -1 0
0 7 0 1
0 9 0 1
0 13 3 0
1
end_operator
begin_operator
unstack red pink robot1
0
4
0 5 -1 0
0 7 0 1
0 9 0 1
0 13 4 0
1
end_operator
begin_operator
unstack red purple robot1
0
4
0 6 -1 0
0 7 0 1
0 9 0 1
0 13 5 0
1
end_operator
begin_operator
unstack red yellow robot1
0
4
0 7 0 1
0 8 -1 0
0 9 0 1
0 13 6 0
1
end_operator
begin_operator
unstack yellow blue robot1
0
4
0 2 -1 0
0 8 0 1
0 9 0 1
0 14 1 0
1
end_operator
begin_operator
unstack yellow green robot1
0
4
0 4 -1 0
0 8 0 1
0 9 0 1
0 14 2 0
1
end_operator
begin_operator
unstack yellow orange robot1
0
4
0 3 -1 0
0 8 0 1
0 9 0 1
0 14 3 0
1
end_operator
begin_operator
unstack yellow pink robot1
0
4
0 5 -1 0
0 8 0 1
0 9 0 1
0 14 4 0
1
end_operator
begin_operator
unstack yellow purple robot1
0
4
0 6 -1 0
0 8 0 1
0 9 0 1
0 14 5 0
1
end_operator
begin_operator
unstack yellow red robot1
0
4
0 7 -1 0
0 8 0 1
0 9 0 1
0 14 6 0
1
end_operator
0
