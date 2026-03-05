(define (problem put_salt_shaker_in_drawer)
  (:domain put_task)
  (:objects
    robot - agent
    drawer - receptacle
    saltshaker - object
  )
  (:init
    ;; receptacle properties
    (openable drawer)

    ;; initial locations (robot starts at no location)
    (atLocation robot saltshaker)

    ;; salt shaker is not in any receptacle initially (on counter)
    ;; drawer is initially closed (so (opened drawer) is false by omission)
  )
  (:goal
    (and
      (inReceptacle saltshaker drawer)
    )
  )
)