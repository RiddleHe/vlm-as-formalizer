(define (domain cooking)
    (:requirements :strips)
    (:types 
        robot 
        object 
        vegetable - object
        tool - object
        location
    )
    (:predicates
        (at ?obj - object ?loc - location)
        (holding ?robot - robot ?obj - object)
        (clear ?obj - object)
        (sliced ?veg - vegetable)
        (in-bowl ?obj - object)
        (is-bowl ?obj - object)
        (is-knife ?obj - object)
    )

    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (clear ?obj) (not (holding ?robot ?obj)))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)))
    )

    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj))
        :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)))
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (at ?veg ?loc) (clear ?veg) (holding ?robot ?tool) (is-knife ?tool) (not (sliced ?veg)))
        :effect (sliced ?veg)
    )
)