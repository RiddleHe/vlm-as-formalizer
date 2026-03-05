(define (problem put_task_kitchen_bread_cool_microwave)
  (:domain put_task)

  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge

    breadslice1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; initial object locations (observed bread slice is on the table/counter, not inside any receptacle)
    (atLocation robot breadslice1)
  )

  (:goal
    (and
      (isCool breadslice1)
      (inReceptacle breadslice1 microwave1)
    )
  )
)