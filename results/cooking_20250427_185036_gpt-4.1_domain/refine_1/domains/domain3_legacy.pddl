(define (domain cooking)
    (:requirements :strips :typing)
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
        (is_bowl ?obj - object)
        (is_tool ?obj - object)
        (is_vegetable ?obj - vegetable)
        (is_sliced_vegetable ?obj - sliced_vegetable)
        (in_bowl ?obj - object ?bowl - bowl)
        (sliced_from ?sliced - sliced_vegetable ?veg - vegetable)
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
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location ?sliced - sliced_vegetable)
        :precondition (and (holding ?robot ?veg) (is_vegetable ?veg) (is_tool ?tool) (at ?tool ?loc) (clear ?veg))
        :effect (and (not (is_vegetable ?veg))
                     (not (holding ?robot ?veg))
                     (is_sliced_vegetable ?sliced)
                     (holding ?robot ?sliced)
                     (sliced_from ?sliced ?veg)
                     (clear ?sliced))
    )
    (:action put-in-bowl
        :parameters (?robot - robot ?obj - object ?bowl - bowl)
        :precondition (and (holding ?robot ?obj) (is_bowl ?bowl) (clear ?bowl))
        :effect (and (in_bowl ?obj ?bowl) (not (holding ?robot ?obj)))
    )
)