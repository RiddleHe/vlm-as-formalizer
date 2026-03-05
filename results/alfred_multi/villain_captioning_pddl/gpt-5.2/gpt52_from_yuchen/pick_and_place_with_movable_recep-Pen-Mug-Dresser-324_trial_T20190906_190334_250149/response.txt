(define (problem put_pen_in_black_cup)
  (:domain put_task)

  (:objects
    robot - agent

    dresser - receptacle
    black_cup - receptacle

    pen - object
    laptop - object
  )

  (:init
    ;; robot starts not at any object's location (so no atLocation facts for robot)

    ;; object placements from the scene
    (inReceptacle laptop dresser)
    (inReceptacle pen dresser)
    (inReceptacle black_cup dresser)
  )

  (:goal
    (and
      (inReceptacle pen black_cup)
    )
  )
)