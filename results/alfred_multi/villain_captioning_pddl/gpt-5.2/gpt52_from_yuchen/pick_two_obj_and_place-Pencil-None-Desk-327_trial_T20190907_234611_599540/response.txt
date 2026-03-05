(define (problem put_two_pencils_on_desk)
  (:domain put_task)
  (:objects
    robot - agent
    desk - receptacle
    pencil1 pencil2 - object
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts)

    ;; both pencils are currently on the desk (i.e., in the desk receptacle)
    (inReceptacle pencil1 desk)
    (inReceptacle pencil2 desk)
  )

  (:goal
    (and
      (inReceptacle pencil1 desk)
      (inReceptacle pencil2 desk)
    )
  )
)