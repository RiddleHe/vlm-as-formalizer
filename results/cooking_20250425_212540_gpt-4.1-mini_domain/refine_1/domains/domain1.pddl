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
        (holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (sliced ?veg - vegetable)
        (is_cucumber ?veg - vegetable)
        (is_bowl ?obj - object)
        (is_knife ?tool - tool)
        (free_hand ?robot - robot)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (free_hand ?robot))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (free_hand ?robot)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)) (free_hand ?robot))
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?tool) (at ?veg ?loc) (is_cucumber ?veg))
        :effect (and (sliced ?veg))
    )
)