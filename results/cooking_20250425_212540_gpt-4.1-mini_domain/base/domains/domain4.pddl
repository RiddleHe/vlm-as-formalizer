(define (domain cooking)
    (:requirements :strips)
    (:types 
        robot
        object
        vegetable - object
        tool - object
        location
        bowl - object
    )
    (:predicates
        (holding ?robot ?obj)
        (at ?obj ?loc)
        (sliced ?veg)
        (clean ?tool)
        (in ?obj ?bowl)
        (available ?obj)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (available ?obj))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (available ?obj)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)) (available ?obj))
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?veg) (at ?tool ?loc) (clean ?tool))
        :effect (and (sliced ?veg) (not (holding ?robot ?veg)))
    )
)