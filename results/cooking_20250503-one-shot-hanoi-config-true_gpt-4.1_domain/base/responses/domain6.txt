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
        (in-bowl ?slice - object ?bowl - object)
        (is-sliced ?veg - vegetable)
        (holding ?robot - robot ?obj - object)
        (handfree ?robot - robot)
        (on-board ?obj - object)
        (is-knife ?tool - tool)
        (is-bowl ?obj - object)
        (is-vegetable ?obj - object)
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
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?tool) (at ?veg ?loc) (is-knife ?tool) (is-vegetable ?veg))
        :effect (and (is-sliced ?veg))
    )
)