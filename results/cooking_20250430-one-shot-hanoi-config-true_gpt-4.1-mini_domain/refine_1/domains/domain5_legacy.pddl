(define (domain cooking)
  (:requirements :strips)
  (:types robot object vegetable tool location bowl)
  (:predicates
      (holding ?robot - robot ?obj - object)
      (at ?obj - object ?loc - location)
      (sliced ?veg - vegetable)
      (is_tool ?obj - object)
      (is_knife ?tool - tool)
      (in_bowl ?veg - vegetable ?bowl - bowl)
      (knife_free)
  )

  (:action pick
    :parameters (?robot - robot ?obj - object ?pick_loc - location)
    :precondition (and (at ?obj ?pick_loc) (not (holding ?robot ?obj)) (or (not (is_knife ?obj)) (knife_free)))
    :effect (and (holding ?robot ?obj)
                 (not (at ?obj ?pick_loc))
                 (when (is_knife ?obj) (not (knife_free)))
                )
  )

  (:action place
    :parameters (?robot - robot ?obj - object ?place_loc - location)
    :precondition (holding ?robot ?obj)
    :effect (and (at ?obj ?place_loc)
                 (not (holding ?robot ?obj))
                 (when (is_knife ?obj) (knife_free))
                 (when (and (sliced ?obj) (exists (?b - bowl) (equal ?place_loc ?b)))
                       (in_bowl ?obj ?place_loc))
           )
  )

  (:action slice
    :parameters (?robot - robot ?veg - vegetable ?tool - tool ?loc - location)
    :precondition (and (holding ?robot ?tool) (is_knife ?tool) (at ?veg ?loc) (not (sliced ?veg)))
    :effect (sliced ?veg)
  )
)