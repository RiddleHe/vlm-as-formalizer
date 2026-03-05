(define (problem put_two_pencils_on_desk)
  (:domain put_task)

  (:objects
    robot - agent
    desk - receptacle
    pencil1 pencil2 - object
  )

  (:init
    ;; robot initially not at any object's location (so no atLocation facts for robot)

    ;; objects on the desk surface (represented as being in the desk receptacle)
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