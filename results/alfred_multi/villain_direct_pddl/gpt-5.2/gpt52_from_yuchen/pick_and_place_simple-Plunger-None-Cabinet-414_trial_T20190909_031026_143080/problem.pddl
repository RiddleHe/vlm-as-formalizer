(define (problem put_plunger_in_cabinet)
  (:domain put_task)
  (:objects
    robot - agent
    plunger - object
    sink_cabinet - receptacle
  )
  (:init
    ;; receptacle properties
    (openable sink_cabinet)

    ;; object locations (robot starts not at any location)
    (atLocation robot plunger)
  )
  (:goal
    (and
      (inReceptacle plunger sink_cabinet)
    )
  )
)