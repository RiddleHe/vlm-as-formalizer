(define (domain cooking)
    (:requirements :strips)
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
        (handempty ?robot - robot)
        (sliced ?veg - vegetable)
        (in-bowl ?veg - vegetable)
        (knife ?tool - tool)
        (free ?robot - robot)
    )
    
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (handempty ?robot))
        :effect (and (holding ?robot ?obj)
                     (not (at ?obj ?pick_loc))
                     (not (handempty ?robot)))
    )

    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj))
        :effect (and (at ?obj ?place_loc)
                     (handempty ?robot)
                     (not (holding ?robot ?obj)))
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (at ?veg ?loc)
                           (holding ?robot ?tool)
                           (knife ?tool)
                           (not (sliced ?veg)))
        :effect (sliced ?veg)
    )

    (:action place-in-bowl
        :parameters (?robot - robot ?veg - vegetable ?bowl - object)
        :precondition (and (sliced ?veg) (holding ?robot ?veg) (at ?bowl ?bowl))
        :effect (and (in-bowl ?veg) (handempty ?robot) (not (holding ?robot ?veg)))
    )
)