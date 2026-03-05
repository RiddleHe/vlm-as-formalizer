(define (problem put_task_cellphone_lamp)
  (:domain put_task)
  (:objects
    robot - agent
    cellphone - object
    tall_lamp - object
  )
  (:init
    ;; Robot starts not at any object's location (no atLocation facts for robot)

    ;; Scene relationships (from the image/instruction)
    ;; Cell phone is next to the tall lamp's light area; model as same location for interaction.
    (atLocation robot cellphone)
    (atLocation robot tall_lamp)
  )
  (:goal
    (and
      ;; "Examine" is not an explicit predicate in the domain; we operationalize it as
      ;; the robot picking up the cell phone (to inspect it).
      (holds robot cellphone)
    )
  )
)