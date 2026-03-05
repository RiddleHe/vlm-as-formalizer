(define (problem put_task_wash_tomato_on_black_table)
  (:domain put_task)

  (:objects
    robot - agent

    kitchenSink - sink
    blackFridge - fridge
    blackTable - receptacle

    tomato - object
    cabbage - object
    spatula - object
    bowl - object
    saltShaker - object
    egg - object
  )

  (:init
    ;; receptacle properties
    (openable blackFridge)

    ;; initial object locations (from scene caption)
    (inReceptacle cabbage kitchenSink)
    (inReceptacle spatula kitchenSink)

    (inReceptacle bowl blackTable)
    (inReceptacle saltShaker blackTable)

    ;; tomato exists but is not clearly visible in the frames; assume it's on the counter area by the sink
    ;; (modeled as atLocation so the robot can pick it up after navigating there)
    ;; egg-like item is also on the counter area by the sink
    (atLocation robot kitchenSink)
    (not (holdsAny robot))
  )

  (:goal
    (and
      (isClean tomato)
      (inReceptacle tomato blackTable)
    )
  )
)