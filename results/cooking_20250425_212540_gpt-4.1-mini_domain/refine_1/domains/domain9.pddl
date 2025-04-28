(define (domain cooking)
    (:requirements :strips)
    (:types
        robot
        object
        location
        vegetable - object
        tool - object
    )
    (:predicates
        (at ?obj - object ?loc - location)
        (holding ?robot - robot ?obj - object)
        (sliced ?veg - vegetable)
        (placed_in ?obj - object ?container - object)
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
        :precondition (and (holding ?robot ?veg) (holding ?robot ?tool) (at ?robot ?loc))
        :effect (sliced ?veg)
    )
)