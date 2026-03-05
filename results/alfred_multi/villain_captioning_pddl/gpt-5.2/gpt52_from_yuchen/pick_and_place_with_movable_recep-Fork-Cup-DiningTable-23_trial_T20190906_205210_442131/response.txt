(define (problem put_task_kitchen_island_cup_fork)
  (:domain put_task)

  (:objects
    robot - agent

    kitchen_island_counter - receptacle
    cup - receptacle
    fork - object
  )

  (:init
    ;; receptacle properties
    (openable kitchen_island_counter)
    (opened kitchen_island_counter)

    ;; initial placements (from scene: cup is under island, fork is on island)
    (inReceptacle cup kitchen_island_counter)
    (inReceptacle fork kitchen_island_counter)

    ;; robot starts not at any object location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle fork cup)
      (inReceptacle cup kitchen_island_counter)
    )
  )
)