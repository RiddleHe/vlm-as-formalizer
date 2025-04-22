(define (domain cooking)
    (:requirements :strips)
    (:predicates
        (sliced ?cucumber)
        (in-bowl ?cucumber)
        (clear ?obj)
    )
    (:action slice
        :parameters (?cucumber)
        :precondition (and (clear ?cucumber) (not (sliced ?cucumber)))
        :effect (and (sliced ?cucumber) (not (clear ?cucumber)))
    )
    (:action place-in-bowl
        :parameters (?cucumber)
        :precondition (and (sliced ?cucumber) (clear bowl))
        :effect (and (in-bowl ?cucumber) (not (sliced ?cucumber)) (not (clear bowl)))
    )
)