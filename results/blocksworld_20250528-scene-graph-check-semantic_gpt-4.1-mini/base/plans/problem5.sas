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
Atom holding(green)
Atom on(green, blue)
Atom on(green, orange)
Atom on(green, red)
Atom on(green, yellow)
Atom ontable(green)
end_variable
begin_variable
var1
-1
2
Atom clear(green)
NegatedAtom clear(green)
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
Atom clear(red)
NegatedAtom clear(red)
end_variable
begin_variable
var5
-1
2
Atom clear(yellow)
NegatedAtom clear(yellow)
end_variable
begin_variable
var6
-1
2
Atom handempty(robot1)
Atom handfull(robot1)
end_variable
begin_variable
var7
-1
6
Atom holding(blue)
Atom on(blue, green)
Atom on(blue, orange)
Atom on(blue, red)
Atom on(blue, yellow)
Atom ontable(blue)
end_variable
begin_variable
var8
-1
6
Atom holding(orange)
Atom on(orange, blue)
Atom on(orange, green)
Atom on(orange, red)
Atom on(orange, yellow)
Atom ontable(orange)
end_variable
begin_variable
var9
-1
6
Atom holding(red)
Atom on(red, blue)
Atom on(red, green)
Atom on(red, orange)
Atom on(red, yellow)
Atom ontable(red)
end_variable
begin_variable
var10
-1
6
Atom holding(yellow)
Atom on(yellow, blue)
Atom on(yellow, green)
Atom on(yellow, orange)
Atom on(yellow, red)
Atom ontable(yellow)
end_variable
6
begin_mutex_group
6
2 0
7 0
0 1
8 1
9 1
10 1
end_mutex_group
begin_mutex_group
6
1 0
7 1
0 0
8 2
9 2
10 2
end_mutex_group
begin_mutex_group
6
3 0
7 2
0 2
8 0
9 3
10 3
end_mutex_group
begin_mutex_group
6
4 0
7 3
0 3
8 3
9 0
10 4
end_mutex_group
begin_mutex_group
6
5 0
7 4
0 4
8 4
9 4
10 0
end_mutex_group
begin_mutex_group
6
6 0
7 0
0 0
8 0
9 0
10 0
end_mutex_group
begin_state
5
1
1
1
1
0
0
2
2
1
4
end_state
begin_goal
4
7 2
8 2
9 1
10 4
end_goal
50
begin_operator
pick-up blue robot1
0
3
0 2 0 1
0 6 0 1
0 7 5 0
1
end_operator
begin_operator
pick-up green robot1
0
3
0 1 0 1
0 6 0 1
0 0 5 0
1
end_operator
begin_operator
pick-up orange robot1
0
3
0 3 0 1
0 6 0 1
0 8 5 0
1
end_operator
begin_operator
pick-up red robot1
0
3
0 4 0 1
0 6 0 1
0 9 5 0
1
end_operator
begin_operator
pick-up yellow robot1
0
3
0 5 0 1
0 6 0 1
0 10 5 0
1
end_operator
begin_operator
put-down blue robot1
0
3
0 2 -1 0
0 6 1 0
0 7 0 5
1
end_operator
begin_operator
put-down green robot1
0
3
0 1 -1 0
0 6 1 0
0 0 0 5
1
end_operator
begin_operator
put-down orange robot1
0
3
0 3 -1 0
0 6 1 0
0 8 0 5
1
end_operator
begin_operator
put-down red robot1
0
3
0 4 -1 0
0 6 1 0
0 9 0 5
1
end_operator
begin_operator
put-down yellow robot1
0
3
0 5 -1 0
0 6 1 0
0 10 0 5
1
end_operator
begin_operator
stack blue green robot1
0
4
0 2 -1 0
0 1 0 1
0 6 1 0
0 7 0 1
1
end_operator
begin_operator
stack blue orange robot1
0
4
0 2 -1 0
0 3 0 1
0 6 1 0
0 7 0 2
1
end_operator
begin_operator
stack blue red robot1
0
4
0 2 -1 0
0 4 0 1
0 6 1 0
0 7 0 3
1
end_operator
begin_operator
stack blue yellow robot1
0
4
0 2 -1 0
0 5 0 1
0 6 1 0
0 7 0 4
1
end_operator
begin_operator
stack green blue robot1
0
4
0 2 0 1
0 1 -1 0
0 6 1 0
0 0 0 1
1
end_operator
begin_operator
stack green orange robot1
0
4
0 1 -1 0
0 3 0 1
0 6 1 0
0 0 0 2
1
end_operator
begin_operator
stack green red robot1
0
4
0 1 -1 0
0 4 0 1
0 6 1 0
0 0 0 3
1
end_operator
begin_operator
stack green yellow robot1
0
4
0 1 -1 0
0 5 0 1
0 6 1 0
0 0 0 4
1
end_operator
begin_operator
stack orange blue robot1
0
4
0 2 0 1
0 3 -1 0
0 6 1 0
0 8 0 1
1
end_operator
begin_operator
stack orange green robot1
0
4
0 1 0 1
0 3 -1 0
0 6 1 0
0 8 0 2
1
end_operator
begin_operator
stack orange red robot1
0
4
0 3 -1 0
0 4 0 1
0 6 1 0
0 8 0 3
1
end_operator
begin_operator
stack orange yellow robot1
0
4
0 3 -1 0
0 5 0 1
0 6 1 0
0 8 0 4
1
end_operator
begin_operator
stack red blue robot1
0
4
0 2 0 1
0 4 -1 0
0 6 1 0
0 9 0 1
1
end_operator
begin_operator
stack red green robot1
0
4
0 1 0 1
0 4 -1 0
0 6 1 0
0 9 0 2
1
end_operator
begin_operator
stack red orange robot1
0
4
0 3 0 1
0 4 -1 0
0 6 1 0
0 9 0 3
1
end_operator
begin_operator
stack red yellow robot1
0
4
0 4 -1 0
0 5 0 1
0 6 1 0
0 9 0 4
1
end_operator
begin_operator
stack yellow blue robot1
0
4
0 2 0 1
0 5 -1 0
0 6 1 0
0 10 0 1
1
end_operator
begin_operator
stack yellow green robot1
0
4
0 1 0 1
0 5 -1 0
0 6 1 0
0 10 0 2
1
end_operator
begin_operator
stack yellow orange robot1
0
4
0 3 0 1
0 5 -1 0
0 6 1 0
0 10 0 3
1
end_operator
begin_operator
stack yellow red robot1
0
4
0 4 0 1
0 5 -1 0
0 6 1 0
0 10 0 4
1
end_operator
begin_operator
unstack blue green robot1
0
4
0 2 0 1
0 1 -1 0
0 6 0 1
0 7 1 0
1
end_operator
begin_operator
unstack blue orange robot1
0
4
0 2 0 1
0 3 -1 0
0 6 0 1
0 7 2 0
1
end_operator
begin_operator
unstack blue red robot1
0
4
0 2 0 1
0 4 -1 0
0 6 0 1
0 7 3 0
1
end_operator
begin_operator
unstack blue yellow robot1
0
4
0 2 0 1
0 5 -1 0
0 6 0 1
0 7 4 0
1
end_operator
begin_operator
unstack green blue robot1
0
4
0 2 -1 0
0 1 0 1
0 6 0 1
0 0 1 0
1
end_operator
begin_operator
unstack green orange robot1
0
4
0 1 0 1
0 3 -1 0
0 6 0 1
0 0 2 0
1
end_operator
begin_operator
unstack green red robot1
0
4
0 1 0 1
0 4 -1 0
0 6 0 1
0 0 3 0
1
end_operator
begin_operator
unstack green yellow robot1
0
4
0 1 0 1
0 5 -1 0
0 6 0 1
0 0 4 0
1
end_operator
begin_operator
unstack orange blue robot1
0
4
0 2 -1 0
0 3 0 1
0 6 0 1
0 8 1 0
1
end_operator
begin_operator
unstack orange green robot1
0
4
0 1 -1 0
0 3 0 1
0 6 0 1
0 8 2 0
1
end_operator
begin_operator
unstack orange red robot1
0
4
0 3 0 1
0 4 -1 0
0 6 0 1
0 8 3 0
1
end_operator
begin_operator
unstack orange yellow robot1
0
4
0 3 0 1
0 5 -1 0
0 6 0 1
0 8 4 0
1
end_operator
begin_operator
unstack red blue robot1
0
4
0 2 -1 0
0 4 0 1
0 6 0 1
0 9 1 0
1
end_operator
begin_operator
unstack red green robot1
0
4
0 1 -1 0
0 4 0 1
0 6 0 1
0 9 2 0
1
end_operator
begin_operator
unstack red orange robot1
0
4
0 3 -1 0
0 4 0 1
0 6 0 1
0 9 3 0
1
end_operator
begin_operator
unstack red yellow robot1
0
4
0 4 0 1
0 5 -1 0
0 6 0 1
0 9 4 0
1
end_operator
begin_operator
unstack yellow blue robot1
0
4
0 2 -1 0
0 5 0 1
0 6 0 1
0 10 1 0
1
end_operator
begin_operator
unstack yellow green robot1
0
4
0 1 -1 0
0 5 0 1
0 6 0 1
0 10 2 0
1
end_operator
begin_operator
unstack yellow orange robot1
0
4
0 3 -1 0
0 5 0 1
0 6 0 1
0 10 3 0
1
end_operator
begin_operator
unstack yellow red robot1
0
4
0 4 -1 0
0 5 0 1
0 6 0 1
0 10 4 0
1
end_operator
0
