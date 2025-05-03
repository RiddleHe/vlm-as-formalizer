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
        (handfree ?robot - robot)
        (sliced ?veg - vegetable)
        (knife ?tool - tool)
        (empty ?loc - location)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (handfree ?robot))
        :effect (and (holding ?robot ?obj) (not (handfree ?robot)) (not (at ?obj ?pick_loc)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj) (empty ?place_loc))
        :effect (and (at ?obj ?place_loc) (handfree ?robot) (not (holding ?robot ?obj)) (not (empty ?place_loc)))
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (at ?veg ?loc) (holding ?robot ?tool) (knife ?tool) (not (sliced ?veg)))
        :effect (sliced ?veg)
    )
)