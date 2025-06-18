(define (problem cooking_task1)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula spoon - tool
        cucumber tomato dressing - vegetable
        bowl cutting_board counter - location
    )
    (:init
        ; Robots states
        (free robot1)
        (carry robot2 knife)
        
        ; Tools
        (can-cut knife)
        (can-cut spatula)
        (can-cut spoon) ; assuming can-cut only knife, but spatula and spoon are tools (not cutters)
        
        ; Objects availability and state
        (available cucumber)
        (available tomato)
        (available dressing)
        (is-whole cucumber)
        (is-whole tomato)
        (not (is-sliced cucumber))
        (not (is-sliced tomato))
        
        ; Object locations
        (at cucumber counter)
        (at tomato counter)
        (at dressing counter)
        (at bowl counter)
        (at cutting_board counter)
        
        ; Workspaces
        (is-workspace cutting_board)
    )
    (:goal 
        (and
            (is-sliced cucumber)
            (not (is-whole cucumber))
            (at cucumber bowl) ; sliced cucumber in bowl
            (at tomato bowl)   ; tomatoes in bowl (whole or sliced)
        )
    )
)