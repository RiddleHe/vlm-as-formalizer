(define (problem put_pen_in_black_cup)
  (:domain put_task)

  (:objects
    robot - agent

    dresser - receptacle
    cup_black - receptacle

    pen - object
    laptop - object
  )

  (:init
    ;; receptacle relations (scene understanding)
    (inReceptacle cup_black dresser)
    (inReceptacle laptop dresser)
    (inReceptacle pen dresser)

    ;; robot initially not at any object's location and holding nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle pen cup_black)
    )
  )
)