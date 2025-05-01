(define (domain cooking)
    (:requirements :strips)
    (:types robot object location vegetable tool bowl cucumber - object)
    (:predicates
        (holding ?robot - robot ?obj - object)
        (at ?obj - object ?loc - location)
        (sliceable ?veg - vegetable)
        (sliced ?veg - vegetable)
        (clean ?obj - object)
        (empty ?bowl - bowl)
        (in ?obj - object ?container - object)
        (available ?tool - tool)
        (holding_knife ?robot - robot)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (not (holding ?robot ?obj)))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)) (not (in ?obj ?place_loc))) ; ensure object is at location, not 'in'
    )
    (:action place_in
        :parameters (?robot - robot ?obj - object ?container - object)
        :precondition (and (holding ?robot ?obj) (clean ?container))
        :effect (and (in ?obj ?container) (not (holding ?robot ?obj)) (not (at ?obj ?container))) ; object's location changes to inside container
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?tool)
                           (at ?veg ?loc)
                           (sliceable ?veg)
                           (holding_knife ?robot))
        :effect (and (sliced ?veg) (not (sliceable ?veg)) )
    )
)