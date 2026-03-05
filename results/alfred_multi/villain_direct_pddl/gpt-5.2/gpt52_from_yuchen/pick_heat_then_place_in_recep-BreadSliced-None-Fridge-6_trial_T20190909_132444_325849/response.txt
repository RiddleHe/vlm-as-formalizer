(define (problem cook_chill_bread_slice)
  (:domain put_task)
  (:objects
    robot - agent

    microwave1 - microwave
    fridge1 - fridge

    bread1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)
    (openable fridge1)

    ;; object locations (robot must go to a location before interacting)
    (atLocation robot microwave1)

    ;; bread starts on the counter (not in any receptacle)
    (atLocation robot bread1)

    ;; microwave/fridge locations
    (atLocation robot fridge1)
  )

  (:goal
    (and
      (isSliced bread1)
      (isHot bread1)
      (isCool bread1)
    )
  )
)