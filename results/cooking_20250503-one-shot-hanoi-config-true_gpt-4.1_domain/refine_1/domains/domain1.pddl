(define (domain cooking)
(:requirements :strips :typing)
(:types
    robot
    object
    vegetable - object
    tool - object
    bowl - object
    sliced-vegetable - object
    location
)
(:predicates
    (at ?obj - object ?loc - location)
    (robot-free ?robot - robot)
    (holding ?robot - robot ?obj - object)
    (is-sliced ?veg - vegetable)
    (in-bowl ?obj - object ?bowl - bowl)
    (is-cucumber ?veg - vegetable)
    (is-knife ?tool - tool)
    (clear ?obj - object)
    (on-table ?obj - object)
    (sliced-version-of ?sliced - sliced-vegetable ?orig - vegetable)
)
(:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and (at ?obj ?pick_loc)
                       (robot-free ?robot)
                       (clear ?obj))
    :effect (and (holding ?robot ?obj)
                 (not (at ?obj ?pick_loc))
                 (not (robot-free ?robot)))
)
(:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (holding ?robot ?obj)
    :effect (and (at ?obj ?place_loc)
                 (robot-free ?robot)
                 (not (holding ?robot ?obj)))
)
(:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location ?sliced - sliced-vegetable)
    :precondition (and (holding ?robot ?tool)
                       (is-knife ?tool)
                       (at ?veg ?loc)
                       (is-cucumber ?veg)
                       (not (is-sliced ?veg))
                       (sliced-version-of ?sliced ?veg)
                       (clear ?veg))
    :effect (and (is-sliced ?veg)
                 (not (at ?veg ?loc))
                 (at ?sliced ?loc)
                 (clear ?sliced)
                 (not (clear ?veg)))
)
)