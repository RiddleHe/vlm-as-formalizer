(define (domain cooking)
    (:requirements :strips)
    (:predicates
        (sliced ?veg)
        (in-bowl ?veg)
        (clear ?x)
        (holding ?tool)
    )
    (:action slice
        :parameters (?veg ?tool)
        :precondition (and (clear ?veg) (holding ?tool))
        :effect (and (sliced ?veg) (not (clear ?veg)))
    )
    (:action place-in-bowl
        :parameters (?veg ?bowl)
        :precondition (sliced ?veg)
        :effect (and (in-bowl ?veg) (clear ?bowl))
    )
)