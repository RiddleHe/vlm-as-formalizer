(define (domain cooking)
    (:requirements :strips)
    (:types
        robot
        location
        object
        vegetable tool - object
    )
    (:predicates
        (at ?obj - object ?loc - location)
        (holding ?robot - robot ?obj - object)
        (empty-hand ?robot - robot)
        (sliced ?veg - vegetable)
        (in-bowl ?veg - vegetable)
        (is-bowl ?obj - object)
        (is-knife ?tool - tool)
        (is-cucumber ?veg - vegetable)
        (clear ?obj - object)
    )

    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (clear ?obj) (empty-hand ?robot))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (empty-hand ?robot)))
    )

    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and 
            (at ?obj ?place_loc)
            (empty-hand ?robot)
            (clear ?obj)
            (not (holding ?robot ?obj))
            ;; Add in-bowl effect ONLY when placing sliced cucumber in bowl
            (when (and (is-bowl ?place_loc) (is-cucumber ?obj) (sliced ?obj))
                (in-bowl ?obj)
            )
        )
    )

    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and 
            (at ?veg ?loc)
            (at ?tool ?loc)
            (is-knife ?tool)
            (is-cucumber ?veg)
            (clear ?veg)
        )
        :effect (sliced ?veg)
    )
)