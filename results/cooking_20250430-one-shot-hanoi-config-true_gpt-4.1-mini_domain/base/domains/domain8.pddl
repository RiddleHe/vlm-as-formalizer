(define (domain cooking)
    (:requirements :strips)
    (:types 
        robot 
        object 
        tool 
        vegetable 
        location
        bowl - object
        tomato - vegetable
        cucumber - vegetable
        knife - tool
    )

    (:predicates
        (holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (sliced ?veg - vegetable)
        (has_tool ?robot - robot ?tool - tool)
        (in ?obj - object ?container - bowl)
        (free_hand ?robot - robot)
    )

    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (free_hand ?robot))
        :effect (and (holding ?robot ?obj) (not (free_hand ?robot)) (not (at ?obj ?pick_loc)))
    )

    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)) (free_hand ?robot))
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?tool) (at ?veg ?loc) (free_hand ?robot))
        :effect (and (sliced ?veg) (not (at ?veg ?loc)))
    )
)