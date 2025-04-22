begin_version
3
end_version
begin_metric
0
end_metric
7
begin_variable
var0
-1
2
Atom clear(bowl)
NegatedAtom clear(bowl)
end_variable
begin_variable
var1
-1
2
Atom on_table(carrot)
NegatedAtom on_table(carrot)
end_variable
begin_variable
var2
-1
2
Atom on_table(tomato)
NegatedAtom on_table(tomato)
end_variable
begin_variable
var3
-1
3
Atom clear(carrot)
Atom sliced(carrot)
<none of those>
end_variable
begin_variable
var4
-1
3
Atom clear(tomato)
Atom sliced(tomato)
<none of those>
end_variable
begin_variable
var5
-1
2
Atom in_bowl(tomato)
NegatedAtom in_bowl(tomato)
end_variable
begin_variable
var6
-1
2
Atom in_bowl(carrot)
NegatedAtom in_bowl(carrot)
end_variable
0
begin_state
0
0
0
0
0
1
1
end_state
begin_goal
4
3 1
4 1
5 0
6 0
end_goal
6
begin_operator
put_in_bowl carrot bowl
1
3 1
3
0 0 0 1
0 6 -1 0
0 1 -1 1
1
end_operator
begin_operator
put_in_bowl carrot tomato
1
3 1
3
0 4 0 2
0 6 -1 0
0 1 -1 1
1
end_operator
begin_operator
put_in_bowl tomato bowl
1
4 1
3
0 0 0 1
0 5 -1 0
0 2 -1 1
1
end_operator
begin_operator
put_in_bowl tomato carrot
1
4 1
3
0 3 0 2
0 5 -1 0
0 2 -1 1
1
end_operator
begin_operator
slice carrot
1
1 0
1
0 3 0 1
1
end_operator
begin_operator
slice tomato
1
2 0
1
0 4 0 1
1
end_operator
0
