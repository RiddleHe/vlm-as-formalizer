(define (domain cooking)
    (:requirements :strips)
    (:types robot object vegetable tool location)
    (:predicates
        (holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (sliced ?veg - vegetable)
        (is_tool ?obj - object)
        (is_knife ?tool - tool)
        (in_bowl ?veg - vegetable ?bowl - object)
        (knife_free)
    )
    
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (not (holding ?robot ?obj)) (knife_free))
        :effect (and (holding ?robot ?obj)
                     (not (at ?obj ?pick_loc))
                     (not (knife_free))
                     )
    )

    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc)
                     (not (holding ?robot ?obj))
                     (knife_free)
                     )
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?tool) (is_knife ?tool) (at ?veg ?loc) (not (sliced ?veg)))
        :effect (sliced ?veg)
    )
)