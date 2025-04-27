(define (domain cooking)
    (:requirements :strips)
    (:types
        robot
        vegetable
        sliced_vegetable
        tool
        location
        bowl
        object
    )
    (:predicates
        (at ?obj - object ?loc - location)
        (holding ?robot - robot ?obj - object)
        (clear ?obj - object)
        (is_sliced ?veg - vegetable)
        (in_bowl ?obj - object ?bowl - bowl)
        (is_bowl ?obj - object)
        (is_tool ?obj - object)
        (is_vegetable ?obj - object)
        (is_sliced_vegetable ?obj - object)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (clear ?obj))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (clear ?obj)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc) (clear ?obj) (not (holding ?robot ?obj)))
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?veg) (is_vegetable ?veg) (is_tool ?tool) (at ?tool ?loc))
        :effect (and (is_sliced ?veg) (not (is_vegetable ?veg)) (is_sliced_vegetable ?veg))
    )
)