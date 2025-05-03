(define (problem slice-cucumber)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber1 - vegetable
        knife1 - tool
        bowl1 - object
        cutting_board1 - location
        bowl_loc - location
        counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife1)
        (can-cut knife1)
        (available cucumber1)
        (is-whole cucumber1)
        (not (is-sliced cucumber1))
        (at cucumber1 counter)
        (at bowl1 bowl_loc)
        (is-workspace cutting_board1)
        (is-workspace counter)
    )
    (:goal
        (and
            (is-sliced cucumber1)
            (at cucumber1 bowl_loc)
        )
    )
)