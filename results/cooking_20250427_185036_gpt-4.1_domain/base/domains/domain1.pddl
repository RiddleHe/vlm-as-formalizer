(define (domain cooking)
    (:requirements :strips)
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
        (clear ?obj - object)
        (sliced ?veg - vegetable)
        (in-bowl ?veg - vegetable)
        (is-bowl ?obj - object)
        (is-knife ?tool - tool)
        (is-cucumber ?veg - vegetable)
        (on-board ?veg - vegetable)
        (empty-hand ?robot - robot)
    )

    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (clear ?obj) (empty-hand ?robot))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (empty-hand ?robot)))
    )

    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc) (clear ?obj) (empty-hand ?robot) (not (holding ?robot ?obj)))
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (at ?veg ?loc) (at ?tool ?loc) (is-knife ?tool) (is-cucumber ?veg) (clear ?veg))
        :effect (and (sliced ?veg))
    )
)