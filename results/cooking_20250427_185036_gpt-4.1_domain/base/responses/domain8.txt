(define (domain cooking)
    (:requirements :strips)
    (:types 
        robot 
        object 
        vegetable - object
        tool - object
        location
        bowl - object
        board - location
        sliced-vegetable - object
    )
    (:predicates
        (at ?obj - object ?loc - location)
        (holding ?robot - robot ?obj - object)
        (clear ?obj - object)
        (unsliced ?veg - vegetable)
        (sliced ?veg - vegetable)
        (in-bowl ?obj - object ?b - bowl)
        (on-board ?obj - object)
        (is-tool ?obj - tool)
        (is-vegetable ?obj - vegetable)
        (is-sliced ?obj - object)
    )

    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (clear ?obj))
        :effect (and (holding ?robot ?obj)
                     (not (at ?obj ?pick_loc)))
    )

    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (not (holding ?robot ?obj))
                     (at ?obj ?place_loc)
                     (clear ?obj))
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?veg)
                           (is-tool ?tool)
                           (unsliced ?veg)
                           (at ?veg ?loc))
        :effect (and (sliced ?veg)
                     (not (unsliced ?veg))
                     (is-sliced ?veg))
    )
)