(define (problem put_task_cup_on_desk)
  (:domain put_task)

  (:objects
    robot - agent
    desk - receptacle
    cup - object
  )

  (:init
    ;; receptacle facts
    ;; (no openable/opened info visible for desk)

    ;; object locations / containment
    (inReceptacle cup desk)

    ;; robot starts not at any object's location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle cup desk)
    )
  )
)