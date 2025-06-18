(define (problem cooking_task)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        knife spatula spoon - tool
        carrot tomato cucumber dressing_bottle - vegetable
        bowl cutting_board counter - location
    )
    (:init
        ; locations
        (is-workspace cutting_board)
        ; carrot and tomato are whole and available at counter
        (is-whole carrot)
        (not (is-sliced carrot))
        (available carrot)
        (at carrot counter)

        (is-whole tomato)
        (not (is-sliced tomato))
        (available tomato)
        (at tomato counter)

        ; cucumber and dressing bottle are other ingredients in the scene (intact)
        (is-whole cucumber)
        (not (is-sliced cucumber))
        (available cucumber)
        (at cucumber counter)

        (is-whole dressing_bottle)
        (not (is-sliced dressing_bottle))
        (available dressing_bottle)
        (at dressing_bottle counter)

        ; robots
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)

        ; bowl and cutting board locations assumed available but empty (no explicit predicates in domain)
    )
    (:goal
        (and
            (is-sliced carrot)
            (not (is-whole carrot))
            (at carrot bowl)
            (is-sliced tomato)
            (not (is-whole tomato))
            (at tomato bowl)
        )
    )
)