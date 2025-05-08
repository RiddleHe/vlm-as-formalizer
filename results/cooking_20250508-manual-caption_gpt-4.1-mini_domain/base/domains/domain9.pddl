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
        (holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (free ?robot - robot)
        (sliced ?veg - vegetable)
        (on_cutting_board ?veg - vegetable)
        (has_knife ?robot - robot ?knife - tool)
        (bowl ?obj - object)
        (cutting_board ?obj - object)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (at ?robot ?pick_loc) (free ?robot))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (free ?robot)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj) (at ?robot ?place_loc))
        :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)) (free ?robot)
                (when (cutting_board ?place_loc) (on_cutting_board ?obj))
        )
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?tool) (sliced ?veg) (at ?veg ?loc) (cutting_board ?loc))
        :effect (sliced ?veg)
    )
)