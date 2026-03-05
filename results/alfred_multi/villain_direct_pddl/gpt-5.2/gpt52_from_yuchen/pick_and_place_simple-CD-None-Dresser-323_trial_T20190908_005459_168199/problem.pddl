(define (problem put_cd_on_dresser)
  (:domain put_task)
  (:objects
    robot - agent

    desk - receptacle
    dresser - receptacle

    cd1 - object
    cd2 - object
  )

  (:init
    ;; objects on/in receptacles
    (inReceptacle cd1 desk)
    (inReceptacle cd2 desk)

    ;; no openable/opened receptacles visible/needed
  )

  (:goal
    (and
      (inReceptacle cd1 dresser)
    )
  )
)