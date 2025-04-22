(define (domain cooking)
    (:requirements :strips)
    (:predicates
        (on-table ?x)
        (sliced ?x)
        (in-bowl ?x)
        (clear ?x)
    )
    (:action slice
        :parameters (?veg)
        :precondition (and (on-table ?veg) (clear ?veg))
        :effect (and (sliced ?veg) (not (clear ?veg)))
    )
    (:action place-in-bowl
        :parameters (?veg)
        :precondition (and (sliced ?veg) (clear ?veg))
        :effect (and (in-bowl ?veg) (not (on-table ?veg)) (not (sliced ?veg)))
    )
)