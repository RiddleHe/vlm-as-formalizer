(define (problem put_pot_spatula_on_table)
  (:domain put_task)
  (:objects
    robot - agent
    table - receptacle
    pot1 - receptacle
    pot2 - receptacle
    spatula - object
  )

  (:init
    ;; receptacle properties (from domain typing)
    ;; agent initially not at any object's location (so no atLocation facts)

    ;; scene configuration
    (inReceptacle pot1 table)
    (inReceptacle pot2 table)
    ;; spatula is currently in/with the right pot (pot2)
    (inReceptacle spatula pot2)
  )

  (:goal
    (and
      (inReceptacle pot2 table)
      (inReceptacle spatula pot2)
    )
  )
)