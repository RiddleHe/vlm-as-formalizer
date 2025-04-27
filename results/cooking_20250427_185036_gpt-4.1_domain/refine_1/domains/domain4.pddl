(define (domain cooking)
    (:requirements :strips :typing)
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
        (is-bowl ?obj - object)
        (is-knife ?obj - object)
        (is-board ?obj - object)
        (is-table ?obj - object)
        (is-robot ?robot - robot)
    )

    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (is-robot ?robot) (not (holding ?robot ?obj)))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)))
    )

    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj) (is-robot ?robot))
        :effect (and 
            (at ?obj ?place_loc) 
            (not (holding ?robot ?obj))
            (when (and (is-bowl ?place_loc) (sliced ?obj) (vegetable ?obj))
                (in-bowl ?obj)
            )
        )
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (at ?veg ?loc)
                           (at ?tool ?loc)
                           (is-knife ?tool)
                           (is-robot ?robot)
                           (not (sliced ?veg)))
        :effect (sliced ?veg)
    )
)