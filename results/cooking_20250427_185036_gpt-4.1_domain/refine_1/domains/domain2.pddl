(define (domain cooking)
    (:requirements :strips)
    (:types 
        robot 
        object 
        vegetable - object 
        sliced_vegetable - object 
        tool - object 
        container - object 
        location
    )
    (:predicates
        (at ?obj - object ?loc - location)
        (holding ?robot - robot ?obj - object)
        (clear ?obj - object)
        (sliced ?veg - vegetable)
        (in ?obj - object ?container - container)
        (is_slice_of ?sliced - sliced_vegetable ?veg - vegetable)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (clear ?obj) (not (holding ?robot ?obj)))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (clear ?obj)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and (at ?obj ?place_loc) (clear ?obj) (not (holding ?robot ?obj)))
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location ?sliced - sliced_vegetable)
        :precondition (and (at ?veg ?loc) (clear ?veg) (holding ?robot ?tool) (not (sliced ?veg)) (is_slice_of ?sliced ?veg))
        :effect (and 
            (sliced ?veg)
            (not (at ?veg ?loc))
            (at ?sliced ?loc)
            (clear ?sliced)
        )
    )
    (:action put-in
        :parameters (?robot - robot ?obj - object ?container - container ?obj_loc - location)
        :precondition (and (holding ?robot ?obj) (at ?container ?obj_loc))
        :effect (and (in ?obj ?container) (clear ?obj) (not (holding ?robot ?obj)))
    )
)