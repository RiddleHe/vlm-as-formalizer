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
        (sliced ?veg - vegetable)
        (in-bowl ?veg - vegetable)
        (clear ?obj - object)
        (is-bowl ?obj - object)
        (is-knife ?obj - object)
        (is-vegetable ?obj - object)
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
        :precondition (and (at ?veg ?loc) (holding ?robot ?veg) (holding ?robot ?tool) (is-knife ?tool) (is-vegetable ?veg) (not (sliced ?veg)))
        :effect (sliced ?veg)
    )

    (:action put-in-bowl
        :parameters (?robot - robot ?veg - vegetable ?bowl - object)
        :precondition (and (holding ?robot ?veg) (is-bowl ?bowl) (sliced ?veg))
        :effect (and (in-bowl ?veg) (not (holding ?robot ?veg)))
    )
)