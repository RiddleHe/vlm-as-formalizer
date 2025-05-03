(define (domain cooking)
(:requirements :strips)

(:types
    robot
    object
    location
    vegetable - object
    tool - object
    slicedvegetable - object
)

(:predicates
    (at ?obj - object ?loc - location)
    (in-bowl ?obj - object ?bowl - object)
    (holding ?robot - robot ?obj - object)
    (free ?robot - robot)
    (sliced ?veg - vegetable)
    (on-chopping-board ?obj - object)
    (clear ?obj - object)
    (is-bowl ?obj - object)
    (is-knife ?obj - object)
    (is-slice-of ?slice - slicedvegetable ?veg - vegetable)
)

(:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and (at ?obj ?pick_loc)
                       (free ?robot)
                       (clear ?obj))
    :effect (and (holding ?robot ?obj)
                 (not (free ?robot))
                 (not (at ?obj ?pick_loc)))
)

(:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (holding ?robot ?obj)
    :effect (and (at ?obj ?place_loc)
                 (free ?robot)
                 (not (holding ?robot ?obj)))
)

(:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location ?slice - slicedvegetable)
    :precondition (and (at ?veg ?loc)
                       (at ?tool ?loc)
                       (holding ?robot ?tool)
                       (on-chopping-board ?veg)
                       (is-knife ?tool)
                       (clear ?veg)
                       (not (sliced ?veg))
                       (is-slice-of ?slice ?veg))
    :effect (and 
              (sliced ?veg)
              (not (at ?veg ?loc))
              (at ?slice ?loc)
              (clear ?slice)
              (not (clear ?veg))
            )
)
)