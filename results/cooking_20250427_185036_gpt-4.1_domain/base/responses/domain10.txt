(define (domain cooking)
  (:requirements :strips)
  (:types
    robot
    object
    location
    vegetable - object
    tool - object
    bowl - object
  )
  (:predicates
    (at ?obj - object ?loc - location)
    (in-bowl ?obj - object ?bowl - bowl)
    (sliced ?veg - vegetable)
    (holding ?robot - robot ?obj - object)
    (free ?robot - robot)
    (is-tool ?tool - tool)
    (is-vegetable ?veg - vegetable)
    (is-bowl ?bowl - bowl)
  )
  (:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and 
      (at ?obj ?pick_loc)
      (free ?robot)
      )
    :effect (and
      (holding ?robot ?obj)
      (not (free ?robot))
      (not (at ?obj ?pick_loc))
      )
  )
  (:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (and
      (holding ?robot ?obj)
      )
    :effect (and
      (at ?obj ?place_loc)
      (free ?robot)
      (not (holding ?robot ?obj))
      )
  )
  (:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
    :precondition (and
      (at ?veg ?loc)
      (at ?tool ?loc)
      (is-tool ?tool)
      (is-vegetable ?veg)
      )
    :effect (and
      (sliced ?veg)
      )
  )
)