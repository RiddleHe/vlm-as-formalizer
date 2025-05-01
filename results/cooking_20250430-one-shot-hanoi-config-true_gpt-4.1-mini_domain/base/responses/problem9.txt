(define (problem cooking_problem_1)
    (:domain cooking)
    (:objects
        robot1
        robot2
        knife
        carrot
        cucumber
        bowl
        table
        cutting_board
    )
    (:init
        (is_knife knife)
        (is_carrot carrot)
        (is_cucumber cucumber)
        (is_bowl bowl)
        (at knife robot1)
        (holding robot1 knife)
        (at carrot table)
        (at cucumber cutting_board)
        (at bowl table)
        (not (holding robot1 carrot))
        (not (holding robot2 carrot))
        (not (holding robot1 cucumber))
        (not (holding robot2 cucumber))
    )
    (:goal (and
        (sliced carrot)
        (sliced_in_bowl carrot)
        (sliced_in_bowl cucumber)
    ))
)