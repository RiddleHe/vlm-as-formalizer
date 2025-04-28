(define (domain cooking)
    (:requirements :strips)
    (:types 
        robot 
        object 
        vegetable - object
        tool - object
        location
        bowl - object
        sliced_vegetable - object
    )
    (:predicates
        (robot-holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (sliceable ?veg - vegetable)
        (sliced ?veg - vegetable)
        (in ?obj - object ?container - object)
        (available ?obj - object)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (available ?obj) (not (robot-holding ?robot ?obj)))
        :effect (and (robot-holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (available ?obj)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (robot-holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc) (not (robot-holding ?robot ?obj)) (available ?obj))
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (sliceable ?veg) (robot-holding ?robot ?veg) (at ?tool ?loc) (not (sliced ?veg)))
        :effect (sliced ?veg)
    )
)