(define (domain cooking)
(:requirements :strips)
(:types robot object vegetable tool location)

(:predicates
    (holding ?robot - robot ?obj - object)
    (at ?obj - object ?loc - location)
    (sliced ?veg - vegetable)
    (has-tool ?robot - robot ?tool - tool)
    (is-knife ?tool - tool)
    (is-bowl ?obj - object)
)

(:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and (at ?obj ?pick_loc) (not (holding ?robot ?obj)))
    :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)))
)

(:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (holding ?robot ?obj)
    :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)))
)

(:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
    :precondition (and (holding ?robot ?tool) (is-knife ?tool) (at ?veg ?loc) (not (sliced ?veg)))
    :effect (and (sliced ?veg))
)
)