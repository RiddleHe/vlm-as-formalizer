(define (problem put_task_spatulas_in_drawer)
  (:domain put_task)
  (:objects
    robot - agent

    drawer - receptacle
    counter - receptacle

    spatula1 - object
    spatula2 - object

    bread1 - object
    bread2 - object
    pot1 - object
    paperstack1 - object
    paperstack2 - object
  )

  (:init
    ;; receptacle properties
    (openable drawer)

    ;; initial object placements (on/in the counter area)
    (inReceptacle spatula1 counter)
    (inReceptacle spatula2 counter)
    (inReceptacle bread1 counter)
    (inReceptacle bread2 counter)
    (inReceptacle pot1 counter)
    (inReceptacle paperstack1 counter)
    (inReceptacle paperstack2 counter)
  )

  (:goal
    (and
      (inReceptacle spatula1 drawer)
      (inReceptacle spatula2 drawer)
    )
  )
)