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
6
Atom holding(green)
Atom on(green, green)
Atom on(green, pink)
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
Atom clear(pink)
NegatedAtom clear(pink)
end_variable
begin_variable
var3
-1
2
Atom clear(red)
NegatedAtom clear(red)
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
Atom handempty()
NegatedAtom handempty()
end_variable
begin_variable
var6
-1
6
Atom holding(pink)
Atom on(pink, green)
Atom on(pink, pink)
Atom on(pink, red)
Atom on(pink, yellow)
Atom ontable(pink)
end_variable
begin_variable
var7
-1
6
Atom holding(red)
Atom on(red, green)
Atom on(red, pink)
Atom on(red, red)
Atom on(red, yellow)
Atom ontable(red)
end_variable
begin_variable
var8
-1
6
Atom holding(yellow)
Atom on(yellow, green)
Atom on(yellow, pink)
Atom on(yellow, red)
Atom on(yellow, yellow)
Atom ontable(yellow)
end_variable
1
begin_mutex_group
5
5 0
0 0
6 0
7 0
8 0
end_mutex_group
begin_state
5
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
6 3
7 4
8 1
end_goal
40
begin_operator
pick-up green robot1
0
3
0 1 0 1
0 5 0 1
0 0 5 0
1
end_operator
begin_operator
pick-up pink robot1
0
3
0 2 0 1
0 5 0 1
0 6 5 0
1
end_operator
begin_operator
pick-up red robot1
0
3
0 3 0 1
0 5 0 1
0 7 5 0
1
end_operator
begin_operator
pick-up yellow robot1
0
3
0 4 0 1
0 5 0 1
0 8 5 0
1
end_operator
begin_operator
put-down green robot1
0
3
0 1 -1 0
0 5 -1 0
0 0 0 5
1
end_operator
begin_operator
put-down pink robot1
0
3
0 2 -1 0
0 5 -1 0
0 6 0 5
1
end_operator
begin_operator
put-down red robot1
0
3
0 3 -1 0
0 5 -1 0
0 7 0 5
1
end_operator
begin_operator
put-down yellow robot1
0
3
0 4 -1 0
0 5 -1 0
0 8 0 5
1
end_operator
begin_operator
stack green green robot1
1
1 0
2
0 5 -1 0
0 0 0 1
1
end_operator
begin_operator
stack green pink robot1
0
4
0 1 -1 0
0 2 0 1
0 5 -1 0
0 0 0 2
1
end_operator
begin_operator
stack green red robot1
0
4
0 1 -1 0
0 3 0 1
0 5 -1 0
0 0 0 3
1
end_operator
begin_operator
stack green yellow robot1
0
4
0 1 -1 0
0 4 0 1
0 5 -1 0
0 0 0 4
1
end_operator
begin_operator
stack pink green robot1
0
4
0 1 0 1
0 2 -1 0
0 5 -1 0
0 6 0 1
1
end_operator
begin_operator
stack pink pink robot1
1
2 0
2
0 5 -1 0
0 6 0 2
1
end_operator
begin_operator
stack pink red robot1
0
4
0 2 -1 0
0 3 0 1
0 5 -1 0
0 6 0 3
1
end_operator
begin_operator
stack pink yellow robot1
0
4
0 2 -1 0
0 4 0 1
0 5 -1 0
0 6 0 4
1
end_operator
begin_operator
stack red green robot1
0
4
0 1 0 1
0 3 -1 0
0 5 -1 0
0 7 0 1
1
end_operator
begin_operator
stack red pink robot1
0
4
0 2 0 1
0 3 -1 0
0 5 -1 0
0 7 0 2
1
end_operator
begin_operator
stack red red robot1
1
3 0
2
0 5 -1 0
0 7 0 3
1
end_operator
begin_operator
stack red yellow robot1
0
4
0 3 -1 0
0 4 0 1
0 5 -1 0
0 7 0 4
1
end_operator
begin_operator
stack yellow green robot1
0
4
0 1 0 1
0 4 -1 0
0 5 -1 0
0 8 0 1
1
end_operator
begin_operator
stack yellow pink robot1
0
4
0 2 0 1
0 4 -1 0
0 5 -1 0
0 8 0 2
1
end_operator
begin_operator
stack yellow red robot1
0
4
0 3 0 1
0 4 -1 0
0 5 -1 0
0 8 0 3
1
end_operator
begin_operator
stack yellow yellow robot1
1
4 0
2
0 5 -1 0
0 8 0 4
1
end_operator
begin_operator
unstack green green robot1
1
1 0
2
0 5 0 1
0 0 1 0
1
end_operator
begin_operator
unstack green pink robot1
1
1 0
3
0 2 -1 0
0 5 0 1
0 0 2 0
1
end_operator
begin_operator
unstack green red robot1
1
1 0
3
0 3 -1 0
0 5 0 1
0 0 3 0
1
end_operator
begin_operator
unstack green yellow robot1
1
1 0
3
0 4 -1 0
0 5 0 1
0 0 4 0
1
end_operator
begin_operator
unstack pink green robot1
1
2 0
3
0 1 -1 0
0 5 0 1
0 6 1 0
1
end_operator
begin_operator
unstack pink pink robot1
1
2 0
2
0 5 0 1
0 6 2 0
1
end_operator
begin_operator
unstack pink red robot1
1
2 0
3
0 3 -1 0
0 5 0 1
0 6 3 0
1
end_operator
begin_operator
unstack pink yellow robot1
1
2 0
3
0 4 -1 0
0 5 0 1
0 6 4 0
1
end_operator
begin_operator
unstack red green robot1
1
3 0
3
0 1 -1 0
0 5 0 1
0 7 1 0
1
end_operator
begin_operator
unstack red pink robot1
1
3 0
3
0 2 -1 0
0 5 0 1
0 7 2 0
1
end_operator
begin_operator
unstack red red robot1
1
3 0
2
0 5 0 1
0 7 3 0
1
end_operator
begin_operator
unstack red yellow robot1
1
3 0
3
0 4 -1 0
0 5 0 1
0 7 4 0
1
end_operator
begin_operator
unstack yellow green robot1
1
4 0
3
0 1 -1 0
0 5 0 1
0 8 1 0
1
end_operator
begin_operator
unstack yellow pink robot1
1
4 0
3
0 2 -1 0
0 5 0 1
0 8 2 0
1
end_operator
begin_operator
unstack yellow red robot1
1
4 0
3
0 3 -1 0
0 5 0 1
0 8 3 0
1
end_operator
begin_operator
unstack yellow yellow robot1
1
4 0
2
0 5 0 1
0 8 4 0
1
end_operator
0
