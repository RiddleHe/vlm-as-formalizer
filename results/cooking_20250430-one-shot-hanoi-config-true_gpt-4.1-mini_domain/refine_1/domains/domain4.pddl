(define (domain cooking)
  (:requirements :strips)
  (:types robot object location vegetable tool bowl)
  (:predicates
    (holding ?robot - robot ?obj - object)
    (at ?obj - object ?loc - location)
    (sliced ?veg - vegetable)
    (in ?obj - object ?container - bowl)
    (available ?obj - object)
    (robot-free ?robot - robot)  ; Robot not holding anything
  )
  (:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and 
                    (at ?obj ?pick_loc)
                    (available ?obj)
                    (robot-free ?robot)
                  )
    :effect (and 
              (holding ?robot ?obj)
              (not (robot-free ?robot))
              (not (at ?obj ?pick_loc))
              (not (available ?obj))
            )
  )
  (:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (holding ?robot ?obj)
    :effect (and 
              (at ?obj ?place_loc)
              (not (holding ?robot ?obj))
              (available ?obj)
              (robot-free ?robot)
            )
  )
  (:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
    :precondition (and 
                    (holding ?robot ?tool)
                    (at ?veg ?loc)
                    (not (sliced ?veg))
                  )
    :effect (sliced ?veg)
  )
)