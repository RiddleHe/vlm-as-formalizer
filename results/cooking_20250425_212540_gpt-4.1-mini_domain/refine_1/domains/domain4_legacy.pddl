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
        (in ?obj ?bowl)                   ; object inside bowl
        (available ?obj)
        (is_bowl ?bowl)                  ; predicate to identify bowls if needed
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (available ?obj) (not (holding ?robot ?obj)))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)) (not (available ?obj)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (holding ?robot ?obj)
        :effect (and 
            (not (holding ?robot ?obj))
            (available ?obj)
            (or 
                (and (bowl ?place_loc) (in ?obj ?place_loc))
                (at ?obj ?place_loc)
            )
        )
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?veg) (at ?tool ?loc) (clean ?tool))
        :effect (and (sliced ?veg) (not (holding ?robot ?veg)))
    )
)
```

Note: Here I added the possibility that the place location can be a bowl, and placing an object in the bowl adds the predicate (in ?obj ?place_loc)