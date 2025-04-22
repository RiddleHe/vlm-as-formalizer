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
Atom sliced(bowl)
NegatedAtom sliced(bowl)
end_variable
begin_variable
var1
-1
2
Atom sliced(knife)
NegatedAtom sliced(knife)
end_variable
begin_variable
var2
-1
2
Atom clear(bowl)
NegatedAtom clear(bowl)
end_variable
begin_variable
var3
-1
2
Atom clear(carrot)
NegatedAtom clear(carrot)
end_variable
begin_variable
var4
-1
2
Atom clear(cucumber)
NegatedAtom clear(cucumber)
end_variable
begin_variable
var5
-1
2
Atom clear(knife)
NegatedAtom clear(knife)
end_variable
begin_variable
var6
-1
2
Atom sliced(carrot)
NegatedAtom sliced(carrot)
end_variable
begin_variable
var7
-1
2
Atom sliced(cucumber)
NegatedAtom sliced(cucumber)
end_variable
begin_variable
var8
-1
2
Atom in-bowl(carrot)
NegatedAtom in-bowl(carrot)
end_variable
begin_variable
var9
-1
2
Atom in-bowl(cucumber)
NegatedAtom in-bowl(cucumber)
end_variable
0
begin_state
1
1
0
0
0
1
1
1
1
1
end_state
begin_goal
4
6 0
7 0
8 0
9 0
end_goal
20
begin_operator
place-in-bowl bowl bowl
1
0 0
1
0 2 -1 0
1
end_operator
begin_operator
place-in-bowl bowl carrot
1
0 0
1
0 3 -1 0
1
end_operator
begin_operator
place-in-bowl bowl cucumber
1
0 0
1
0 4 -1 0
1
end_operator
begin_operator
place-in-bowl bowl knife
1
0 0
1
0 5 -1 0
1
end_operator
begin_operator
place-in-bowl carrot bowl
1
6 0
2
0 2 -1 0
0 8 -1 0
1
end_operator
begin_operator
place-in-bowl carrot carrot
1
6 0
2
0 3 -1 0
0 8 -1 0
1
end_operator
begin_operator
place-in-bowl carrot cucumber
1
6 0
2
0 4 -1 0
0 8 -1 0
1
end_operator
begin_operator
place-in-bowl carrot knife
1
6 0
2
0 5 -1 0
0 8 -1 0
1
end_operator
begin_operator
place-in-bowl cucumber bowl
1
7 0
2
0 2 -1 0
0 9 -1 0
1
end_operator
begin_operator
place-in-bowl cucumber carrot
1
7 0
2
0 3 -1 0
0 9 -1 0
1
end_operator
begin_operator
place-in-bowl cucumber cucumber
1
7 0
2
0 4 -1 0
0 9 -1 0
1
end_operator
begin_operator
place-in-bowl cucumber knife
1
7 0
2
0 5 -1 0
0 9 -1 0
1
end_operator
begin_operator
place-in-bowl knife bowl
1
1 0
1
0 2 -1 0
1
end_operator
begin_operator
place-in-bowl knife carrot
1
1 0
1
0 3 -1 0
1
end_operator
begin_operator
place-in-bowl knife cucumber
1
1 0
1
0 4 -1 0
1
end_operator
begin_operator
place-in-bowl knife knife
1
1 0
1
0 5 -1 0
1
end_operator
begin_operator
slice bowl knife
0
2
0 2 0 1
0 0 -1 0
1
end_operator
begin_operator
slice carrot knife
0
2
0 3 0 1
0 6 -1 0
1
end_operator
begin_operator
slice cucumber knife
0
2
0 4 0 1
0 7 -1 0
1
end_operator
begin_operator
slice knife knife
0
2
0 5 0 1
0 1 -1 0
1
end_operator
0
