(define (domain cooking)
  (:requirements :strips)
  (:types 
    robot
    object
    vegetable - object
    tool - object
    bowl - object
    board - object
    location
  )
  (:predicates
    (at ?obj - object ?loc - object)
    (holding ?robot - robot ?obj - object)
    (clear ?obj - object)
    (unsliced ?veg - vegetable)
    (sliced ?veg - vegetable)
    (in-bowl ?obj - object ?b - bowl)
    (is-tool ?obj - tool)
    (is-vegetable ?obj - vegetable)
  )

  (:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - object)
    :precondition (and (at ?obj ?pick_loc) (clear ?obj))
    :effect (and (holding ?robot ?obj)
                 (not (at ?obj ?pick_loc))
                 (not (clear ?obj)))
  )

  (:action place
    :parameters (?robot - robot ?obj - object ?place_loc - object)
    :precondition (and (holding ?robot ?obj))
    :effect (and (not (holding ?robot ?obj))
                 (at ?obj ?place_loc)
                 (clear ?obj))
  )

  (:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - object)
    :precondition (and (holding ?robot ?veg)
                       (is-tool ?tool)
                       (unsliced ?veg)
                       (at ?veg ?loc))
    :effect (and (sliced ?veg)
                 (not (unsliced ?veg)))
  )
)