(define (problem put_clock_on_desk)
  (:domain put_task)
  (:objects
    robot - agent
    clock1 - object
    desk1 - receptacle
    hutch1 - receptacle
    phone1 - object
    disc1 - object
    lamp1 - object
    blackrect1 - object
  )
  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; receptacle relations inferred from the scene
    (inReceptacle clock1 hutch1)
    (inReceptacle phone1 desk1)
    (inReceptacle disc1 desk1)
    (inReceptacle lamp1 hutch1)
    (inReceptacle blackrect1 hutch1)
  )
  (:goal
    (and
      (inReceptacle clock1 desk1)
    )
  )
)