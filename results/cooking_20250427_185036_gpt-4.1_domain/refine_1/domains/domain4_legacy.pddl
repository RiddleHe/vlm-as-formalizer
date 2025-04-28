(define (domain cooking)
    (:requirements :strips :typing)
    (:types
        robot
        object
        vegetable - object
        tool - object
        bowl - object
        location
    )
    (:predicates
        (at ?obj - object ?loc - location)
        (holding ?robot - robot ?obj - object)
        (clear ?obj - object)
        (sliced ?veg - vegetable)
        (in-bowl ?veg - vegetable)
        (is-bowl ?obj - bowl)
        (is-knife ?obj - tool)
        (is-board ?obj - tool)
        (is-table ?obj - object)
        (is-robot ?robot - robot)
    )

    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (clear ?obj) (is-robot ?robot))
        :effect (and (holding ?robot ?obj)
                     (not (at ?obj ?pick_loc))
                     (not (clear ?obj)))
    )

    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj) (is-robot ?robot))
        :effect (and (at ?obj ?place_loc)
                     (clear ?obj)
                     (not (holding ?robot ?obj)))
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (at ?veg ?loc)
                           (at ?tool ?loc)
                           (is-knife ?tool)
                           (is-robot ?robot)
                           (clear ?veg)
                           (not (sliced ?veg)))
        :effect (sliced ?veg)
    )

    (:action put-in-bowl
        :parameters (?robot - robot ?veg - vegetable ?bowl - bowl)
        :precondition (and (holding ?robot ?veg)
                           (is-bowl ?bowl)
                           (sliced ?veg))
        :effect (and (in-bowl ?veg)
                     (clear ?veg)
                     (not (holding ?robot ?veg)))
    )
)