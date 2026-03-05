(define (problem put_task_lettuce_garbage)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge
    garbagecan1 - receptacle

    lettuce1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object locations / containment
    (inReceptacle lettuce1 fridge1)

    ;; lettuce is already cold
    (isCool lettuce1)
  )

  (:goal
    (and
      (inReceptacle lettuce1 garbagecan1)
      (isCool lettuce1)
    )
  )
)