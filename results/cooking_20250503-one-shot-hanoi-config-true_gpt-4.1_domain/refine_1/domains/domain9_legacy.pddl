(define (domain cooking)
(:requirements :strips :typing)
(:types 
    robot 
    object 
    vegetable - object
    tool - object
    location
    sliced_vegetable - object
)
(:predicates
    (at ?obj - object ?loc - location)
    (holding ?robot - robot ?obj - object)
    (handempty ?robot - robot)
    (sliced ?veg - vegetable)
    (available ?robot - robot)
    (in-bowl ?obj - object)
    (is-bowl ?obj - object)
    (is-knife ?obj - object)
    (corresponds ?sliced - sliced_vegetable ?orig - vegetable) ; connects sliced object and its unsliced form
    (exists ?obj - object) ; tracks which objects are available
)

(:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and (available ?robot) (at ?obj ?pick_loc) (handempty ?robot) (exists ?obj))
    :effect (and (holding ?robot ?obj) (not (handempty ?robot)) (not (at ?obj ?pick_loc)))
)

(:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (and (holding ?robot ?obj))
    :effect (and (at ?obj ?place_loc) (handempty ?robot) (not (holding ?robot ?obj)))
)

(:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location ?sliced_veg - sliced_vegetable)
    :precondition (and 
        (holding ?robot ?tool) 
        (is-knife ?tool)
        (at ?veg ?loc) 
        (not (sliced ?veg))
        (corresponds ?sliced_veg ?veg)
        (exists ?veg)
        (exists ?sliced_veg)
    )
    :effect (and 
        (sliced ?veg)
        (not (exists ?veg))
        (exists ?sliced_veg)
        (at ?sliced_veg ?loc)
        (not (at ?veg ?loc))
    )
)

(:action put-in-bowl
    :parameters (?robot - robot ?obj - object ?bowl - object)
    :precondition (and
        (holding ?robot ?obj)
        (is-bowl ?bowl)
    )
    :effect (and
        (in-bowl ?obj)
        (handempty ?robot)
        (not (holding ?robot ?obj))
        (at ?obj ?bowl)
    )
)
)