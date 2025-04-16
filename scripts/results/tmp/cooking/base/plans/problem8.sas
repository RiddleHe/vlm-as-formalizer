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
3
Atom at(knife, bowl)
Atom at(knife, cutting_board)
<none of those>
end_variable
begin_variable
var1
-1
2
Atom available(knife)
NegatedAtom available(knife)
end_variable
begin_variable
var2
-1
3
Atom at(tomato, bowl)
Atom at(tomato, cutting_board)
<none of those>
end_variable
begin_variable
var3
-1
4
Atom carry(a_bot, cucumber)
Atom carry(a_bot, knife)
Atom carry(a_bot, tomato)
Atom free(a_bot)
end_variable
begin_variable
var4
-1
2
Atom available(tomato)
NegatedAtom available(tomato)
end_variable
begin_variable
var5
-1
4
Atom carry(b_bot, cucumber)
Atom carry(b_bot, knife)
Atom carry(b_bot, tomato)
Atom free(b_bot)
end_variable
begin_variable
var6
-1
2
Atom available(cucumber)
NegatedAtom available(cucumber)
end_variable
begin_variable
var7
-1
3
Atom at(cucumber, bowl)
Atom at(cucumber, cutting_board)
<none of those>
end_variable
begin_variable
var8
-1
2
Atom is-sliced(cucumber)
Atom is-whole(cucumber)
end_variable
6
begin_mutex_group
4
7 0
7 1
3 0
5 0
end_mutex_group
begin_mutex_group
4
0 0
0 1
3 1
5 1
end_mutex_group
begin_mutex_group
4
2 0
2 1
3 2
5 2
end_mutex_group
begin_mutex_group
3
6 0
3 0
5 0
end_mutex_group
begin_mutex_group
3
1 0
3 1
5 1
end_mutex_group
begin_mutex_group
3
4 0
3 2
5 2
end_mutex_group
begin_state
2
1
1
3
0
1
0
1
1
end_state
begin_goal
2
7 0
8 0
end_goal
38
begin_operator
pick a_bot cucumber bowl
0
3
0 7 0 2
0 6 0 1
0 3 3 0
1
end_operator
begin_operator
pick a_bot cucumber cutting_board
0
3
0 7 1 2
0 6 0 1
0 3 3 0
1
end_operator
begin_operator
pick a_bot knife bowl
0
3
0 0 0 2
0 1 0 1
0 3 3 1
1
end_operator
begin_operator
pick a_bot knife cutting_board
0
3
0 0 1 2
0 1 0 1
0 3 3 1
1
end_operator
begin_operator
pick a_bot tomato bowl
0
3
0 2 0 2
0 4 0 1
0 3 3 2
1
end_operator
begin_operator
pick a_bot tomato cutting_board
0
3
0 2 1 2
0 4 0 1
0 3 3 2
1
end_operator
begin_operator
pick b_bot cucumber bowl
0
3
0 7 0 2
0 6 0 1
0 5 3 0
1
end_operator
begin_operator
pick b_bot cucumber cutting_board
0
3
0 7 1 2
0 6 0 1
0 5 3 0
1
end_operator
begin_operator
pick b_bot knife bowl
0
3
0 0 0 2
0 1 0 1
0 5 3 1
1
end_operator
begin_operator
pick b_bot knife cutting_board
0
3
0 0 1 2
0 1 0 1
0 5 3 1
1
end_operator
begin_operator
pick b_bot tomato bowl
0
3
0 2 0 2
0 4 0 1
0 5 3 2
1
end_operator
begin_operator
pick b_bot tomato cutting_board
0
3
0 2 1 2
0 4 0 1
0 5 3 2
1
end_operator
begin_operator
place a_bot cucumber bowl
0
3
0 7 1 0
0 6 -1 0
0 3 0 3
1
end_operator
begin_operator
place a_bot cucumber bowl
0
3
0 7 2 0
0 6 -1 0
0 3 0 3
1
end_operator
begin_operator
place a_bot cucumber cutting_board
0
3
0 7 0 1
0 6 -1 0
0 3 0 3
1
end_operator
begin_operator
place a_bot cucumber cutting_board
0
3
0 7 2 1
0 6 -1 0
0 3 0 3
1
end_operator
begin_operator
place a_bot knife bowl
0
3
0 0 1 0
0 1 -1 0
0 3 1 3
1
end_operator
begin_operator
place a_bot knife bowl
0
3
0 0 2 0
0 1 -1 0
0 3 1 3
1
end_operator
begin_operator
place a_bot knife cutting_board
0
3
0 0 0 1
0 1 -1 0
0 3 1 3
1
end_operator
begin_operator
place a_bot knife cutting_board
0
3
0 0 2 1
0 1 -1 0
0 3 1 3
1
end_operator
begin_operator
place a_bot tomato bowl
0
3
0 2 1 0
0 4 -1 0
0 3 2 3
1
end_operator
begin_operator
place a_bot tomato bowl
0
3
0 2 2 0
0 4 -1 0
0 3 2 3
1
end_operator
begin_operator
place a_bot tomato cutting_board
0
3
0 2 0 1
0 4 -1 0
0 3 2 3
1
end_operator
begin_operator
place a_bot tomato cutting_board
0
3
0 2 2 1
0 4 -1 0
0 3 2 3
1
end_operator
begin_operator
place b_bot cucumber bowl
0
3
0 7 1 0
0 6 -1 0
0 5 0 3
1
end_operator
begin_operator
place b_bot cucumber bowl
0
3
0 7 2 0
0 6 -1 0
0 5 0 3
1
end_operator
begin_operator
place b_bot cucumber cutting_board
0
3
0 7 0 1
0 6 -1 0
0 5 0 3
1
end_operator
begin_operator
place b_bot cucumber cutting_board
0
3
0 7 2 1
0 6 -1 0
0 5 0 3
1
end_operator
begin_operator
place b_bot knife bowl
0
3
0 0 1 0
0 1 -1 0
0 5 1 3
1
end_operator
begin_operator
place b_bot knife bowl
0
3
0 0 2 0
0 1 -1 0
0 5 1 3
1
end_operator
begin_operator
place b_bot knife cutting_board
0
3
0 0 0 1
0 1 -1 0
0 5 1 3
1
end_operator
begin_operator
place b_bot knife cutting_board
0
3
0 0 2 1
0 1 -1 0
0 5 1 3
1
end_operator
begin_operator
place b_bot tomato bowl
0
3
0 2 1 0
0 4 -1 0
0 5 2 3
1
end_operator
begin_operator
place b_bot tomato bowl
0
3
0 2 2 0
0 4 -1 0
0 5 2 3
1
end_operator
begin_operator
place b_bot tomato cutting_board
0
3
0 2 0 1
0 4 -1 0
0 5 2 3
1
end_operator
begin_operator
place b_bot tomato cutting_board
0
3
0 2 2 1
0 4 -1 0
0 5 2 3
1
end_operator
begin_operator
slice a_bot cucumber knife cutting_board
2
7 1
3 1
1
0 8 1 0
1
end_operator
begin_operator
slice b_bot cucumber knife cutting_board
2
7 1
5 1
1
0 8 1 0
1
end_operator
0
