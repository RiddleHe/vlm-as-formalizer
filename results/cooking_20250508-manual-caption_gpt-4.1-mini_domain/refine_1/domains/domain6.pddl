(define (domain cooking)
(:requirements :strips)
(:types 
    robot
    object
    vegetable - object
    tool - object
    location
    container - object
)
(:predicates
    (holding ?robot - robot ?obj - object)
    (at ?obj - object ?loc - location)
    (free ?robot - robot)
    (sharp ?tool - tool)
    (sliced ?veg - vegetable)
    (on ?veg - vegetable ?loc - location)
    (in ?veg - vegetable ?container - container)
)
(:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and (at ?obj ?pick_loc) (free ?robot) (not (holding ?robot ?obj)))
    :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (free ?robot)))
)
(:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (holding ?robot ?obj)
    :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)) (free ?robot))
)
(:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
    :precondition (and (holding ?robot ?tool) (sharp ?tool) (on ?veg cutting_board) (not (sliced ?veg)))
    :effect (sliced ?veg)
)
)