(define (problem put_task_cold_lettuce_trash)
  (:domain put_task)

  (:objects
    agent1 - agent

    fridge1 - fridge
    garbagecan1 garbagecan2 - receptacle

    lettuce1 tomato1 - object

    knife1 knife2 - knife
  )

  (:init
    ;; receptacle properties
    (openable fridge1)

    ;; initial receptacle contents
    (inReceptacle tomato1 garbagecan1)

    ;; object locations (agent must navigate first)
    (atLocation agent1 lettuce1)
    (atLocation agent1 knife1)
    (atLocation agent1 knife2)
    (atLocation agent1 fridge1)
    (atLocation agent1 garbagecan1)
    (atLocation agent1 garbagecan2)

    ;; agent starts holding nothing
    (not (holdsAny agent1))

    ;; fridge starts closed (not opened)
    (not (opened fridge1))
  )

  (:goal
    (and
      (isCool lettuce1)
      (inReceptacle lettuce1 garbagecan1)
    )
  )
)