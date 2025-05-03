(define (domain cooking)
(:requirements :strips :typing)
(:types 
    robot 
    object 
    vegetable - object
    sliced-vegetable - object
    tool - object
    bowl - object
    location
)
(:predicates
    (at ?obj - object ?loc - location)
    (in-bowl ?obj - object ?bowl - bowl)
    (is-sliced ?veg - vegetable)
    (exists-sliced ?sliced - sliced-vegetable)
    (holding ?robot - robot ?obj - object)
    (handfree ?robot - robot)
    (on-board ?obj - object)
    (is-knife ?tool - tool)
)

(:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and (at ?obj ?pick_loc) (handfree ?robot))
    :effect (and (holding ?robot ?obj) (not (handfree ?robot)) (not (at ?obj ?pick_loc)))
)

(:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (holding ?robot ?obj)
    :effect (and (at ?obj ?place_loc) (handfree ?robot) (not (holding ?robot ?obj)))
)

(:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location ?sliced - sliced-vegetable)
    :precondition (and (holding ?robot ?tool) (at ?veg ?loc) (is-knife ?tool) (not (is-sliced ?veg)))
    :effect (and 
        (is-sliced ?veg) 
        (exists-sliced ?sliced)
        (at ?sliced ?loc)
    )
)
)