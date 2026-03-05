(define (problem chill-mug-and-place-on-rack)
  (:domain put_task)

  (:objects
    robot - agent
    mug - object
    fridge1 - fridge
    rack1 - receptacle
    knife1 - knife
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; initial containment / locations
    (inReceptacle mug rack1) ;; not true in scene; mug is on coffee machine area, but coffee machine not modeled
    ;; therefore we model mug as directly locatable
    (atLocation robot fridge1) ;; robot must start not at any object's location; so we omit all atLocation facts

    ;; mug initial state (not cooled, not held)
    ;; (isCool mug) is false by omission
    ;; (holdsAny robot) is false by omission
  )

  (:goal
    (and
      (isCool mug)
      (inReceptacle mug rack1)
    )
  )
)