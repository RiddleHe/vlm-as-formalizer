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
        (clear ?obj - object)
        (sliced ?veg - vegetable)
        (in-bowl ?obj - object)
        (is-bowl ?obj - object)
        (is-knife ?obj - object)
    )
    
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc)
                           (clear ?obj)
                           (not (holding ?robot ?obj)))
        :effect (and (holding ?robot ?obj)
                     (not (at ?obj ?pick_loc))
                     (not (clear ?obj)))
    )

    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj))
        :effect (and (at ?obj ?place_loc)
                     (clear ?obj)
                     (not (holding ?robot ?obj)))
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (at ?veg ?loc)
                           (at ?tool ?loc)
                           (is-knife ?tool)
                           (clear ?veg)
                           (not (sliced ?veg)))
        :effect (sliced ?veg)
    )

    (:action place_in_bowl
        :parameters (?robot - robot ?obj - object ?bowl - object)
        :precondition (and (holding ?robot ?obj)
                           (is-bowl ?bowl)
                           (sliced ?obj))
        :effect (and (in-bowl ?obj)
                     (not (holding ?robot ?obj)))
    )
)