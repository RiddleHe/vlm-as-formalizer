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
        :precondition (and (holding ?robot ?obj))
        :effect (and (at ?obj ?place_loc) (handempty ?robot) (not (holding ?robot ?obj)))
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (at ?veg ?loc)
                           (at ?tool ?loc)
                           (is-knife ?tool)
                           (handempty ?robot)
                           (not (sliced ?veg))
                           (not (holding ?robot ?veg)))
        :effect (sliced ?veg)
    )
)