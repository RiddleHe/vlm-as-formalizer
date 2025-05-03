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
2
Atom at(knife, chopping_board)
NegatedAtom at(knife, chopping_board)
end_variable
begin_variable
var1
-1
2
Atom at(knife, table)
NegatedAtom at(knife, table)
end_variable
begin_variable
var2
-1
3
Atom at(bowl1, chopping_board)
Atom at(bowl1, table)
<none of those>
end_variable
begin_variable
var3
-1
5
Atom handfree(robot1)
Atom holding(robot1, bowl1)
Atom holding(robot1, cucumber)
Atom holding(robot1, knife)
Atom holding(robot1, tomato)
end_variable
begin_variable
var4
-1
5
Atom handfree(robot2)
Atom holding(robot2, bowl1)
Atom holding(robot2, cucumber)
Atom holding(robot2, knife)
Atom holding(robot2, tomato)
end_variable
begin_variable
var5
-1
4
Atom at(cucumber, chopping_board)
Atom at(cucumber, table)
Atom in-bowl(cucumber, bowl1)
<none of those>
end_variable
begin_variable
var6
-1
2
Atom sliced(cucumber)
NegatedAtom sliced(cucumber)
end_variable
begin_variable
var7
-1
4
Atom at(tomato, chopping_board)
Atom at(tomato, table)
Atom in-bowl(tomato, bowl1)
<none of those>
end_variable
begin_variable
var8
-1
2
Atom sliced(tomato)
NegatedAtom sliced(tomato)
end_variable
6
begin_mutex_group
4
2 0
2 1
3 1
4 1
end_mutex_group
begin_mutex_group
4
2 0
2 1
3 1
4 1
end_mutex_group
begin_mutex_group
4
5 0
5 1
3 2
4 2
end_mutex_group
begin_mutex_group
5
5 0
5 1
5 2
3 2
4 2
end_mutex_group
begin_mutex_group
4
7 0
7 1
3 4
4 4
end_mutex_group
begin_mutex_group
5
7 0
7 1
7 2
3 4
4 4
end_mutex_group
begin_state
1
0
1
0
3
0
1
0
1
end_state
begin_goal
4
5 2
6 0
7 2
8 0
end_goal
44
begin_operator
pick robot1 bowl1 chopping_board
0
2
0 2 0 2
0 3 0 1
1
end_operator
begin_operator
pick robot1 bowl1 table
0
2
0 2 1 2
0 3 0 1
1
end_operator
begin_operator
pick robot1 cucumber chopping_board
0
2
0 5 0 3
0 3 0 2
1
end_operator
begin_operator
pick robot1 cucumber table
0
2
0 5 1 3
0 3 0 2
1
end_operator
begin_operator
pick robot1 knife chopping_board
0
2
0 0 0 1
0 3 0 3
1
end_operator
begin_operator
pick robot1 knife table
0
2
0 1 0 1
0 3 0 3
1
end_operator
begin_operator
pick robot1 tomato chopping_board
0
2
0 7 0 3
0 3 0 4
1
end_operator
begin_operator
pick robot1 tomato table
0
2
0 7 1 3
0 3 0 4
1
end_operator
begin_operator
pick robot2 bowl1 chopping_board
0
2
0 2 0 2
0 4 0 1
1
end_operator
begin_operator
pick robot2 bowl1 table
0
2
0 2 1 2
0 4 0 1
1
end_operator
begin_operator
pick robot2 cucumber chopping_board
0
2
0 5 0 3
0 4 0 2
1
end_operator
begin_operator
pick robot2 cucumber table
0
2
0 5 1 3
0 4 0 2
1
end_operator
begin_operator
pick robot2 knife chopping_board
0
2
0 0 0 1
0 4 0 3
1
end_operator
begin_operator
pick robot2 knife table
0
2
0 1 0 1
0 4 0 3
1
end_operator
begin_operator
pick robot2 tomato chopping_board
0
2
0 7 0 3
0 4 0 4
1
end_operator
begin_operator
pick robot2 tomato table
0
2
0 7 1 3
0 4 0 4
1
end_operator
begin_operator
place robot1 bowl1 chopping_board
0
2
0 2 -1 0
0 3 1 0
1
end_operator
begin_operator
place robot1 bowl1 table
0
2
0 2 -1 1
0 3 1 0
1
end_operator
begin_operator
place robot1 cucumber chopping_board
0
2
0 5 -1 0
0 3 2 0
1
end_operator
begin_operator
place robot1 cucumber table
0
2
0 5 -1 1
0 3 2 0
1
end_operator
begin_operator
place robot1 knife chopping_board
0
2
0 0 -1 0
0 3 3 0
1
end_operator
begin_operator
place robot1 knife table
0
2
0 1 -1 0
0 3 3 0
1
end_operator
begin_operator
place robot1 tomato chopping_board
0
2
0 7 -1 0
0 3 4 0
1
end_operator
begin_operator
place robot1 tomato table
0
2
0 7 -1 1
0 3 4 0
1
end_operator
begin_operator
place robot2 bowl1 chopping_board
0
2
0 2 -1 0
0 4 1 0
1
end_operator
begin_operator
place robot2 bowl1 table
0
2
0 2 -1 1
0 4 1 0
1
end_operator
begin_operator
place robot2 cucumber chopping_board
0
2
0 5 -1 0
0 4 2 0
1
end_operator
begin_operator
place robot2 cucumber table
0
2
0 5 -1 1
0 4 2 0
1
end_operator
begin_operator
place robot2 knife chopping_board
0
2
0 0 -1 0
0 4 3 0
1
end_operator
begin_operator
place robot2 knife table
0
2
0 1 -1 0
0 4 3 0
1
end_operator
begin_operator
place robot2 tomato chopping_board
0
2
0 7 -1 0
0 4 4 0
1
end_operator
begin_operator
place robot2 tomato table
0
2
0 7 -1 1
0 4 4 0
1
end_operator
begin_operator
put-in-bowl robot1 cucumber bowl1
1
6 0
2
0 5 -1 2
0 3 2 0
1
end_operator
begin_operator
put-in-bowl robot1 tomato bowl1
1
8 0
2
0 7 -1 2
0 3 4 0
1
end_operator
begin_operator
put-in-bowl robot2 cucumber bowl1
1
6 0
2
0 5 -1 2
0 4 2 0
1
end_operator
begin_operator
put-in-bowl robot2 tomato bowl1
1
8 0
2
0 7 -1 2
0 4 4 0
1
end_operator
begin_operator
slice robot1 cucumber knife chopping_board
2
5 0
3 3
1
0 6 1 0
1
end_operator
begin_operator
slice robot1 cucumber knife table
2
5 1
3 3
1
0 6 1 0
1
end_operator
begin_operator
slice robot1 tomato knife chopping_board
2
7 0
3 3
1
0 8 1 0
1
end_operator
begin_operator
slice robot1 tomato knife table
2
7 1
3 3
1
0 8 1 0
1
end_operator
begin_operator
slice robot2 cucumber knife chopping_board
2
5 0
4 3
1
0 6 1 0
1
end_operator
begin_operator
slice robot2 cucumber knife table
2
5 1
4 3
1
0 6 1 0
1
end_operator
begin_operator
slice robot2 tomato knife chopping_board
2
7 0
4 3
1
0 8 1 0
1
end_operator
begin_operator
slice robot2 tomato knife table
2
7 1
4 3
1
0 8 1 0
1
end_operator
0
