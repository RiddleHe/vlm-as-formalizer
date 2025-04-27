(define (domain cooking)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        robot
        object
        vegetable - object
        tool - object
        bowl - object
        location
    )
    (:predicates
        (holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (sliced ?veg - vegetable)
        (in ?obj - object ?container - object)
        (available ?tool - tool)
        (robot_at ?robot - robot ?loc - location)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (robot_at ?robot ?pick_loc))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj) (robot_at ?robot ?place_loc))
        :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)))
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?veg) (available ?tool) (robot_at ?robot ?loc) (not (sliced ?veg)))
        :effect (and (sliced ?veg) (not (holding ?robot ?veg)))
    )
)