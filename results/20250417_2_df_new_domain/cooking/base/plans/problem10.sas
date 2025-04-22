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
Atom on-board(carrot1)
Atom sliced(carrot1)
end_variable
begin_variable
var1
-1
2
Atom on-board(carrot2)
Atom sliced(carrot2)
end_variable
begin_variable
var2
-1
2
Atom on-board(tomato1)
Atom sliced(tomato1)
end_variable
begin_variable
var3
-1
2
Atom clear(carrot1)
NegatedAtom clear(carrot1)
end_variable
begin_variable
var4
-1
2
Atom clear(carrot2)
NegatedAtom clear(carrot2)
end_variable
begin_variable
var5
-1
2
Atom clear(tomato1)
NegatedAtom clear(tomato1)
end_variable
begin_variable
var6
-1
2
Atom clear(bowl1)
NegatedAtom clear(bowl1)
end_variable
begin_variable
var7
-1
2
Atom in-bowl(tomato1)
NegatedAtom in-bowl(tomato1)
end_variable
begin_variable
var8
-1
2
Atom in-bowl(carrot2)
NegatedAtom in-bowl(carrot2)
end_variable
begin_variable
var9
-1
2
Atom in-bowl(carrot1)
NegatedAtom in-bowl(carrot1)
end_variable
0
begin_state
0
0
0
0
0
0
0
1
1
1
end_state
begin_goal
3
7 0
8 0
9 0
end_goal
15
begin_operator
place-in-bowl carrot1 bowl1
1
0 1
2
0 6 0 1
0 9 -1 0
1
end_operator
begin_operator
place-in-bowl carrot1 carrot1
1
0 1
2
0 3 0 1
0 9 -1 0
1
end_operator
begin_operator
place-in-bowl carrot1 carrot2
1
0 1
2
0 4 0 1
0 9 -1 0
1
end_operator
begin_operator
place-in-bowl carrot1 tomato1
1
0 1
2
0 5 0 1
0 9 -1 0
1
end_operator
begin_operator
place-in-bowl carrot2 bowl1
1
1 1
2
0 6 0 1
0 8 -1 0
1
end_operator
begin_operator
place-in-bowl carrot2 carrot1
1
1 1
2
0 3 0 1
0 8 -1 0
1
end_operator
begin_operator
place-in-bowl carrot2 carrot2
1
1 1
2
0 4 0 1
0 8 -1 0
1
end_operator
begin_operator
place-in-bowl carrot2 tomato1
1
1 1
2
0 5 0 1
0 8 -1 0
1
end_operator
begin_operator
place-in-bowl tomato1 bowl1
1
2 1
2
0 6 0 1
0 7 -1 0
1
end_operator
begin_operator
place-in-bowl tomato1 carrot1
1
2 1
2
0 3 0 1
0 7 -1 0
1
end_operator
begin_operator
place-in-bowl tomato1 carrot2
1
2 1
2
0 4 0 1
0 7 -1 0
1
end_operator
begin_operator
place-in-bowl tomato1 tomato1
1
2 1
2
0 5 0 1
0 7 -1 0
1
end_operator
begin_operator
slice carrot1
1
3 0
1
0 0 0 1
1
end_operator
begin_operator
slice carrot2
1
4 0
1
0 1 0 1
1
end_operator
begin_operator
slice tomato1
1
5 0
1
0 2 0 1
1
end_operator
0
