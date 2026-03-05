(define (problem put_task_kitchen_island_cup_fork)
  (:domain put_task)

  (:objects
    robot - agent

    kitchen_island_counter - receptacle
    cup1 - object
    fork1 - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; receptacle
    (inReceptacle cup1 kitchen_island_counter)
    (inReceptacle fork1 kitchen_island_counter)
  )

  (:goal
    (and
      (inReceptacle fork1 cup1)
      (inReceptacle cup1 kitchen_island_counter)
    )
  )
)