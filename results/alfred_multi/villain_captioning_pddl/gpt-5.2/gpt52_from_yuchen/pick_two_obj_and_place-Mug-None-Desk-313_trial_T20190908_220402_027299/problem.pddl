(define (problem put_task_cup_on_desk)
  (:domain put_task)

  (:objects
    robot_1 - agent
    desk_1 - receptacle
    cup_1 - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts initially)
    ;; Robot starts holding nothing
    (not (holdsAny robot_1))

    ;; Cup is not on/in the desk initially
    (not (inReceptacle cup_1 desk_1))

    ;; Cup starts at its own location so it can be navigated to and picked up
    (atLocation robot_1 cup_1)
    (not (atLocation robot_1 desk_1))
  )

  (:goal
    (and
      (inReceptacle cup_1 desk_1)
    )
  )
)