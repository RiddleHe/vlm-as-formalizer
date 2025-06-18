(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula spoon - tool
        carrot cucumber - vegetable
        bowl cutting_board counter - location
    )
    (:init
        ; robots
        (free robot1)
        (carry robot2 knife)
        ; tools
        (can-cut knife)
        (available spatula)
        (available spoon)
        ; vegetables
        (is-whole carrot)
        (not (is-sliced carrot))
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (available carrot)
        (available cucumber)
        ; objects locations
        (at carrot counter)
        (at cucumber counter)
        (at bowl counter)
        (at cutting_board cutting_board)
        ; workspace
        (is-workspace cutting_board)
    )
    (:goal (and
        (is-sliced carrot)
        (at carrot bowl)
        (at cucumber bowl)
    ))
)