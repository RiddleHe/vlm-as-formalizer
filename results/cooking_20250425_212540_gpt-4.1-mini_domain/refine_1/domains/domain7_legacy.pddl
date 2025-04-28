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
        (in ?obj ?container)
        (available ?tool)
        (robot_at ?robot ?loc)
    )
    (:action pick
        :parameters (?robot - robot ?obj - object ?pick_loc - location)
        :precondition (and (at ?obj ?pick_loc) (robot_at ?robot ?pick_loc))
        :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)))
    )
    (:action place
        :parameters (?robot - robot ?obj - object ?place_loc - location)
        :precondition (and (holding ?robot ?obj) (robot_at ?robot ?place_loc))
        :effect (and 
                  (not (holding ?robot ?obj)) 
                  (at ?obj ?place_loc)
                  (when (or (sliced ?obj)) (in ?obj ?place_loc))
              )
    )
    (:action slice
        :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
        :precondition (and (holding ?robot ?veg) (available ?tool) (robot_at ?robot ?loc) (not (sliced ?veg)))
        :effect (and (sliced ?veg) (not (holding ?robot ?veg)))
    )
)
```

Key changes:
- The place action now adds the predicate `(in ?obj ?place_loc)` whenever the placed object is sliced, supporting placing sliced vegetables inside the bowl.
- The place action effect removes holding and places the object at a location.
- This semantics allows a plan to pick a vegetable, slice it, then pick the sliced vegetable again (implicitly considered sliced object can be picked)