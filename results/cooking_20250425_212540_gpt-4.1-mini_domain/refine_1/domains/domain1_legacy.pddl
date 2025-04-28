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
        (holding ?robot ?obj)
        (at ?obj ?loc)
        (sliced ?veg)
        (is_cucumber ?veg)
        (is_bowl ?obj)
        (is_knife ?tool)
        (free_hand ?robot)
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
        :precondition (and (holding ?robot ?veg) (holding ?robot ?tool) (at ?veg ?loc) (is_cucumber ?veg))
        :effect (sliced ?veg)
    )
)