(define (problem cooking_task)
    (:domain cooking)
    (:objects
        counter cutting_board bowl - location
        carrot cucumber - vegetable
        knife spatula spoon - tool
        robot1 robot2 - robot
    )
    (:init
        (at carrot counter)
        (is-whole carrot)
        (not (is-sliced carrot))
        (at cucumber cutting_board)
        (is-sliced cucumber)
        (available carrot)
        (available cucumber)
        (is-workspace cutting_board)
        (at bowl counter)
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
    )
    (:goal (and
        (is-sliced carrot)
        (at carrot bowl)
        (at cucumber bowl)
    ))
)