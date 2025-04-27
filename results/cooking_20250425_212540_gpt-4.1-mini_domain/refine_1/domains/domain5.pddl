(define (domain cooking)
    (:requirements :strips)
    (:types 
        robot 
        object 
        vegetable - object
        tool - object
        bowl - object
        location
    )
    (:predicates
        (holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (sliced ?veg - vegetable)
        (isTool ?obj - tool)
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
        :precondition (and (holding ?robot ?veg) (isTool ?tool) (at ?veg ?loc) (at ?tool ?loc))
        :effect (and (sliced ?veg) (not (holding ?robot ?veg)) (at ?veg ?loc))
    )
)