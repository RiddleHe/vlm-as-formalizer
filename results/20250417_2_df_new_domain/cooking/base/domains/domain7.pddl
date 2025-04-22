(define (domain cooking)
    (:requirements :strips)
    (:predicates
        (sliced ?vegetable)
        (in-bowl ?vegetable)
        (available ?vegetable)
    )
    (:action slice
        :parameters (?vegetable)
        :precondition (and (available ?vegetable) (not (sliced ?vegetable)))
        :effect (and (sliced ?vegetable) (not (available ?vegetable)))
    )
    (:action place-in-bowl
        :parameters (?vegetable)
        :precondition (sliced ?vegetable)
        :effect (and (in-bowl ?vegetable) (not (sliced ?vegetable)))
    )
)