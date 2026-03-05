(define (problem put_two_phones_on_dresser)
  (:domain put_task)

  (:objects
    robot - agent
    phone1 phone2 - object
    dresser - receptacle
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts)

    ;; Phones are initially elsewhere (not in the dresser)
    ;; (no inReceptacle facts for the phones)

    ;; Dresser is a receptacle; no evidence it is openable in the scene
  )

  (:goal
    (and
      (inReceptacle phone1 dresser)
      (inReceptacle phone2 dresser)
    )
  )
)