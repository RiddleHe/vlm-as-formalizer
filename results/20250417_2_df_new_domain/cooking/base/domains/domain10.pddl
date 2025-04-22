(define (domain cooking)
    (:requirements :strips)
    (:predicates
        (sliced ?x)
        (in-bowl ?x)
        (on-board ?x)
        (clear ?x)
    )
    (:action slice
        :parameters (?tomato)
        :precondition (and (on-board ?tomato) (clear ?tomato))
        :effect (and (sliced ?tomato) (not (on-board ?tomato)) (clear ?tomato))
    )
    (:action place-in-bowl
        :parameters (?item ?bowl)
        :precondition (and (sliced ?item) (clear ?bowl))
        :effect (and (in-bowl ?item) (not (clear ?bowl)))
    )
)