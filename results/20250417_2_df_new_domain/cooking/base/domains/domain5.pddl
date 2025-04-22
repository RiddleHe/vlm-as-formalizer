(define (domain cooking)
    (:requirements :strips)
    (:predicates
        (sliced ?item)
        (in_bowl ?item)
        (clear ?item)
        (on_counter ?item)
    )
    (:action slice
        :parameters (?item)
        :precondition (and (on_counter ?item) (clear ?item))
        :effect (and (sliced ?item) (not (clear ?item)))
    )
    (:action place_in_bowl
        :parameters (?item)
        :precondition (and (sliced ?item) (clear ?item))
        :effect (and (in_bowl ?item) (not (on_counter ?item)))
    )
)