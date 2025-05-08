(define (domain cooking)
    (:requirements :strips)
    (:types
        robot
        object
        vegetable - object
        tool - object
        location
        bowl - object
        cutting_board - location
        counter - location
    )
    (:predicates
        (holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (free ?robot - robot)
        (sliced ?veg - vegetable)
        (on_cutting_board ?veg - vegetable)
        (has_knife ?robot - robot ?tool - tool)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (free ?robot) (not (holding ?robot ?obj)))
        :effect (and (holding ?robot ?obj)
                     (not (at ?obj ?pick_loc))
                     (not (free ?robot)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc)
                     (not (holding ?robot ?obj))
                     (free ?robot))
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?tool)
                           (at ?veg ?loc)
                           (on_cutting_board ?veg)
                           (cutting_board ?loc)) ; Added predicate to identify cutting_board location
        :effect (sliced ?veg)
    )
)