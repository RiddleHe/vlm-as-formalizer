(define (domain cooking)
(:requirements :strips :typing)
(:types
    robot
    object
    tool - object
    vegetable - object
    location
)
(:predicates
    (at ?obj - object ?loc - location)
    (holding ?robot - robot ?obj - object)
    (handempty ?robot - robot)
    (sliced ?veg - vegetable)
    (in-bowl ?obj - object)
    (is-bowl ?obj - object)
    (is-knife ?obj - tool)
    (is-tomato ?obj - vegetable)
    (is-carrot ?obj - vegetable)
    (on ?obj - object ?surface - location)
)

(:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and (at ?obj ?pick_loc) (handempty ?robot) (not (is-bowl ?obj)))
    :effect (and (holding ?robot ?obj) (not (handempty ?robot)) (not (at ?obj ?pick_loc)))
)

(:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (and (holding ?robot ?obj) (not (is-bowl ?place_loc)))
    :effect (and (at ?obj ?place_loc) (handempty ?robot) (not (holding ?robot ?obj)))
)

(:action place-in-bowl
    :parameters (?robot - robot ?obj - object ?bowl - object)
    :precondition (and (holding ?robot ?obj) (is-bowl ?bowl))
    :effect (and (in-bowl ?obj) (handempty ?robot) (not (holding ?robot ?obj)) (not (at ?obj ?bowl)))
)

(:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
    :precondition (and (at ?veg ?loc)
                       (holding ?robot ?tool)
                       (is-knife ?tool)
                       (not (sliced ?veg))
                       (handempty ?robot))
    :effect (sliced ?veg)
)
)