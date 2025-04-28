(define (domain cooking)
    (:requirements :strips)
    (:types
        robot
        object
        vegetable - object
        tool - object
        location
        container - object
        bowl - container
    )
    (:predicates
        (holding ?robot ?obj)
        (at ?obj ?loc)
        (in ?obj ?container)
        (sliced ?veg)
        (is_vegetable ?obj)
        (is_bowl ?obj)
        (available ?tool)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (not (holding ?robot ?obj)))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (in ?obj ?container)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_target - (either location container))
        :precondition (holding ?robot ?obj)
        :effect (and 
                  (not (holding ?robot ?obj))
                  (or (and (location? ?place_target) (at ?obj ?place_target))
                      (and (container? ?place_target) (in ?obj ?place_target)))
                 )
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?veg) (available ?tool) (at ?veg ?loc))
        :effect (and (sliced ?veg) (not (holding ?robot ?veg)) (at ?veg ?loc))
    )
)