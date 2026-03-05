(define (problem put_task_cd_desk_to_dresser)
  (:domain put_task)
  (:objects
    robot - agent
    desk - receptacle
    dresser - receptacle
    cd1 - object
  )
  (:init
    ;; receptacles (not openable/closed in this scene)
    (inReceptacle cd1 desk)
  )
  (:goal
    (and
      (inReceptacle cd1 dresser)
    )
  )
)