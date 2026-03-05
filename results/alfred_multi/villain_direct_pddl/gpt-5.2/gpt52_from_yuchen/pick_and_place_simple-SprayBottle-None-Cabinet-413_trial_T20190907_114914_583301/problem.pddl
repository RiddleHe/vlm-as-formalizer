(define (problem put_spray_bottle_in_cabinet)
  (:domain put_task)

  (:objects
    robot - agent
    spraybottle - object
    cabinet - receptacle
  )

  (:init
    ;; Robot starts not at any location (no atLocation facts)

    ;; Cabinet is a receptacle (not openable/opened specified from scene)
    
    ;; Spray bottle is initially on/at the cabinet (on top of the toilet tank, modeled as cabinet location object)
    (inReceptacle spraybottle cabinet)
  )

  (:goal
    (and
      (inReceptacle spraybottle cabinet)
    )
  )
)