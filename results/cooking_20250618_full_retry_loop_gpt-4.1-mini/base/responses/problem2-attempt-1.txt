(define (problem slice_tomato)
    (:domain cooking)
    (:objects
        robot1
        robot2
        knife - tool
        tomato cucumber dressing_bottle - vegetable
        cutting_board bowl counter - location
    )
    (:init
        (free robot1)
        (carry robot2 knife)
        (can-cut knife)
        (is-whole tomato)
        (not (is-sliced tomato))
        (is-whole cucumber)
        (is-sliced dressing_bottle) ; assuming dressing bottle is not a vegetable and cannot be sliced
        (at tomato counter)
        (at cucumber counter)
        (at dressing_bottle counter)
        (at cutting_board cutting_board)
        (at bowl bowl)
        (at counter counter)
        (is-workspace cutting_board)
        (available tomato)
        (available cucumber)
        (available dressing_bottle)
    )
    (:goal (and
        (is-sliced tomato)
        (at tomato bowl)
    ))
)