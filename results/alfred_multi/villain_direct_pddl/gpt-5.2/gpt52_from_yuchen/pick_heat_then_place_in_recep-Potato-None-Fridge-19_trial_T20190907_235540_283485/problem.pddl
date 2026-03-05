(define (problem put_task_problem_1)
  (:domain put_task)
  (:objects
    robot - agent

    fridge1 - fridge
    microwave1 - microwave

    potato1 - object
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; object locations (robot must navigate first)
    (atLocation robot microwave1)
    (atLocation robot potato1)

    ;; initial containment (potato is on/at the microwave area; model as inside microwave)
    (inReceptacle potato1 microwave1)

    ;; robot hand state
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isHot potato1)
      (inReceptacle potato1 fridge1)
    )
  )
)