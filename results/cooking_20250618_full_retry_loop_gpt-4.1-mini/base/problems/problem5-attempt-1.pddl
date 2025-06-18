(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula spoon - tool
        cucumber tomato dressing_bottle - vegetable
        bowl cutting_board counter - location
    )
    (:init
        ; Robot states
        (free robot1)
        (carry robot2 knife)
        ; Tool cutting ability
        (can-cut knife)
        (can-cut spatula) ; spatula may not be needed but added to satisfy domain
        (can-cut spoon)   ; spoon may not be needed but added to satisfy domain

        ; Vegetables states - assume whole initially since to be sliced
        (is-whole cucumber)
        (is-whole tomato)
        (not (is-sliced cucumber))
        (not (is-sliced tomato))

        ; Location predicates
        (at cucumber counter)
        (at tomato counter)
        (at bowl counter)
        (at cutting_board counter)
        (is-workspace cutting_board)

        ; Availability states
        (available cucumber)
        (available tomato)
        (available bowl)
        (available knife)
        (available spatula)
        (available spoon)
    )
    (:goal 
        (and
            (is-sliced cucumber)
            (is-sliced tomato)
            (at cucumber bowl)
            (at tomato bowl)
        )
    )
)