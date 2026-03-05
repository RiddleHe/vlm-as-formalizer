(define (problem put_two_phones_on_dresser)
  (:domain put_task)

  (:objects
    robot - agent
    dresser_foot - receptacle
    phone_1 phone_2 - object
  )

  (:init
    ;; robot initial conditions (not at any location; not holding anything)
    (not (holdsAny robot))

    ;; dresser acts as a receptacle for placing objects "on" it
    ;; (no evidence it is openable/opened; leaving those unspecified)

    ;; phone_1 is on a wooden surface (not in a receptacle) and can be approached directly
    (atLocation robot phone_1)

    ;; phone_2 exists but its exact location is not visible in the provided views
    ;; (no atLocation facts asserted for it; it is not known to be in any receptacle)

    ;; ensure phones are not initially in the dresser
    (not (inReceptacle phone_1 dresser_foot))
    (not (inReceptacle phone_2 dresser_foot))
  )

  (:goal
    (and
      (inReceptacle phone_1 dresser_foot)
      (inReceptacle phone_2 dresser_foot)
    )
  )
)