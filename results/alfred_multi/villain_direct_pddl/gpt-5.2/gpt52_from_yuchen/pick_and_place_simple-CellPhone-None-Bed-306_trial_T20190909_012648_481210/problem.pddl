(define (problem put_phone_on_bed)
  (:domain put_task)

  (:objects
    robot - agent
    bed - receptacle
    desk - receptacle
    phone - object
  )

  (:init
    ;; receptacle properties
    ;; (openable ...) not specified for any visible receptacle

    ;; initial object placements
    (inReceptacle phone desk)

    ;; robot initially not at any object's location and holds nothing
  )

  (:goal
    (and
      (inReceptacle phone bed)
    )
  )
)