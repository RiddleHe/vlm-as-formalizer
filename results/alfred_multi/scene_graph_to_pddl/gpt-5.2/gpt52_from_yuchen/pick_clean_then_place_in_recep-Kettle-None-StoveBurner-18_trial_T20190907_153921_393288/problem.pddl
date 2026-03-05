(define (problem put_task_teapot_on_stove)
  (:domain put_task)
  (:objects
    robot - agent
    double-basin-metal-sink-with-central-faucet - sink
    silver-tea-kettle-with-blue-handle-on-stove - object
    gray-funnel-in-pan-on-stove - object
    metal-pan-on-left-burner - receptacle
    stove-cooktop-surface - receptacle
    white-countertop-to-right-of-stove - receptacle
    metal-fork-on-white-countertop - object
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; receptacle relationships from scene graph
    (inReceptacle gray-funnel-in-pan-on-stove metal-pan-on-left-burner)
  )

  (:goal
    (and
      (isClean silver-tea-kettle-with-blue-handle-on-stove)
      (inReceptacle silver-tea-kettle-with-blue-handle-on-stove stove-cooktop-surface)
    )
  )
)