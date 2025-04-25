(define (domain cooking)
    (:requirements :strips)
    (:types
        robot
        object
        vegetable - object
        tool - object
        location
        bowl - object
        sliced - object
    )
    (:predicates
        (holding ?robot ?obj)
        (at ?obj ?loc)
        (sliced ?veg)
        (is_vegetable ?obj)
        (is_bowl ?obj)
        (available ?tool)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (not (holding ?robot ?obj)))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)))
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?veg) (available ?tool) (at ?veg ?loc))
        :effect (and (sliced ?veg) (not (holding ?robot ?veg)) (at ?veg ?loc))
    )
)