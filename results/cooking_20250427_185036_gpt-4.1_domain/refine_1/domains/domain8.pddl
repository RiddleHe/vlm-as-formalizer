(define (domain cooking)
  (:requirements :strips)
  (:types 
    robot 
    object 
    vegetable - object
    tool - object
    location
    bowl - object
    board - location
    sliced-object - object
  )
  (:predicates
    (at ?obj - object ?loc - location)
    (holding ?robot - robot ?obj - object)
    (clear ?obj - object)
    (unsliced ?veg - vegetable)
    (sliced ?veg - vegetable)
    (in-bowl ?obj - object ?b - bowl)
    (on-board ?obj - object)
    (is-tool ?obj - tool)
    (is-vegetable ?obj - vegetable)
    (is-sliced-object ?obj - sliced-object)
    (slices-of ?slices - sliced-object ?veg - vegetable)
  )

  (:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and (at ?obj ?pick_loc) (clear ?obj))
    :effect (and (holding ?robot ?obj)
                 (not (at ?obj ?pick_loc)))
  )

  (:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (holding ?robot ?obj)
    :effect (and (not (holding ?robot ?obj))
                 (at ?obj ?place_loc)
                 (clear ?obj))
  )

  (:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location ?slices - sliced-object)
    :precondition (and (holding ?robot ?veg)
                       (is-tool ?tool)
                       (unsliced ?veg)
                       (at ?veg ?loc)
                       (is-vegetable ?veg)
                       (is-sliced-object ?slices)
                       (slices-of ?slices ?veg))
    :effect (and (sliced ?veg)
                 (not (unsliced ?veg))
                 (not (at ?veg ?loc))
                 (at ?slices ?loc)
                 (clear ?slices))
  )

  (:action place-in-bowl
    :parameters (?robot - robot ?obj - object ?b - bowl)
    :precondition (and (holding ?robot ?obj) (at ?b ?b))
    :effect (and (in-bowl ?obj ?b)
                 (not (holding ?robot ?obj))
                 (clear ?obj))
  )
)