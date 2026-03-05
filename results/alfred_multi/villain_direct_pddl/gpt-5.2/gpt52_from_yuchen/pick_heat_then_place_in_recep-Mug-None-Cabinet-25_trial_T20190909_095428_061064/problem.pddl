(define (problem put_task_mug_warm_cabinet)
  (:domain put_task)
  (:objects
    robot - agent
    mug - object
    microwave - microwave
    cabinet - receptacle
  )
  (:init
    ;; receptacle properties
    (openable cabinet)

    ;; initial object locations
    (atLocation robot microwave)
    (atLocation mug microwave)

    ;; robot starts holding nothing
    (not (holdsAny robot))
  )
  (:goal
    (and
      (isHot mug)
      (inReceptacle mug cabinet)
    )
  )
)