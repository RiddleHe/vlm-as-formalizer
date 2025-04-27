(define (domain cooking)
  (:requirements :strips :typing)
  (:types 
    robot 
    object 
    vegetable tool - object
    location
  )
  (:predicates
    (at ?obj ?loc)
    (holding ?robot ?obj)
    (sliced ?veg)
    (in-bowl ?obj)
    (clear ?obj)
    (is-bowl ?obj)
    (is-knife ?obj)
  )

  (:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and (at ?obj ?pick_loc) (clear ?obj) (not (holding ?robot ?obj)))
    :effect (and (holding ?robot ?obj) (not (at ?obj ?pick_loc)))
  )

  (:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (and (holding ?robot ?obj))
    :effect (and (at ?obj ?place_loc) (not (holding ?robot ?obj)))
  )

  (:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
    :precondition (and (at ?veg ?loc) (holding ?robot ?veg) (holding ?robot ?tool) (is-knife ?tool) (not (sliced ?veg)))
    :effect (sliced ?veg)
  )

  (:action put-in-bowl
    :parameters (?robot - robot ?obj - object ?bowl - object)
    :precondition (and (holding ?robot ?obj) (is-bowl ?bowl))
    :effect (and (in-bowl ?obj) (not (holding ?robot ?obj)))
  )
)