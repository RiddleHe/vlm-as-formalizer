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
        (handempty ?robot - robot)
        (unsliced ?veg - vegetable)
        (sliced ?veg - vegetable)
        (in-bowl ?veg - vegetable)
        (is-bowl ?obj - object)
        (is-cutting-board ?obj - object)
        (is-knife ?obj - object)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (handempty ?robot))
        :effect (and (holding ?robot ?obj)
                     (not (at ?obj ?pick_loc))
                     (not (handempty ?robot)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc)
                     (handempty ?robot)
                     (not (holding ?robot ?obj)))
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?veg) (at ?tool ?loc) (is-knife ?tool)
                           (at ?veg ?loc) (unsliced ?veg))
        :effect (and (sliced ?veg) (not (unsliced ?veg)))
    )
    (:action put-in-bowl
        :parameters (?robot - robot ?veg - vegetable ?bowl - object)
        :precondition (and (holding ?robot ?veg) (sliced ?veg) (is-bowl ?bowl))
        :effect (and (in-bowl ?veg)
                     (handempty ?robot)
                     (not (holding ?robot ?veg)))
    )
)