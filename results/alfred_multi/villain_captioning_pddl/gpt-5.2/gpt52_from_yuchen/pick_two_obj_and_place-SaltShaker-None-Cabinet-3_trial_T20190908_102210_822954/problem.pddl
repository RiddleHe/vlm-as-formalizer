(define (problem move_two_saltshakers_to_lower_cabinet)
  (:domain put_task)

  (:objects
    robot - agent

    saltshaker1 saltshaker2 - object
    shelf - receptacle
    lower_cabinet - receptacle
    kitchen_sink - sink
  )

  (:init
    ;; robot initial hand state
    (not (holdsAny robot))

    ;; receptacle properties
    (openable lower_cabinet)
    (not (opened lower_cabinet))

    ;; object locations / containment
    (inReceptacle saltshaker1 shelf)
    (inReceptacle saltshaker2 shelf)
  )

  (:goal
    (and
      (inReceptacle saltshaker1 lower_cabinet)
      (inReceptacle saltshaker2 lower_cabinet)
    )
  )
)