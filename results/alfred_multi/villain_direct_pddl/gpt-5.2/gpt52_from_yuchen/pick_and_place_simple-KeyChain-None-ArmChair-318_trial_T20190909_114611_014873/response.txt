(define (problem move_keys_desk_to_armchair)
  (:domain put_task)
  (:objects
    robot - agent
    desk - receptacle
    armchair - receptacle
    keys - object
  )

  (:init
    ;; receptacles in the scene
    (inReceptacle keys desk)
  )

  (:goal
    (and
      (inReceptacle keys armchair)
    )
  )
)