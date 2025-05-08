(define (problem cook-slice-cucumber)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        cucumber - vegetable
        knife - tool
        bowl cutting_board counter - location
    )
    (:init
        ; Robots
        (free robot1)
        (carry robot2 knife)

        ; Tools & Capabilities
        (can-cut knife)
        (available cucumber)
        
        ; Objects & Locations
        (is-whole cucumber)
        (at cucumber counter)
        (at bowl counter)
        (at knife robot2) ; knife is being held
        (is-workspace cutting_board)

        ; Initial not-sliced state
        (not (is-sliced cucumber))
    )
    (:goal
        (and
            (is-sliced cucumber)
            (at cucumber bowl)
        )
    )
)