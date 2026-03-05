(define (problem put_clock_on_desk)
  (:domain put_task)
  (:objects
    robot - agent
    desk - receptacle
    clock - object
  )
  (:init
    ;; Robot starts not at any object's location (no atLocation facts for robot)

    ;; Object locations / containment
    (inReceptacle clock desk)
  )
  (:goal
    (and
      (inReceptacle clock desk)
    )
  )
)