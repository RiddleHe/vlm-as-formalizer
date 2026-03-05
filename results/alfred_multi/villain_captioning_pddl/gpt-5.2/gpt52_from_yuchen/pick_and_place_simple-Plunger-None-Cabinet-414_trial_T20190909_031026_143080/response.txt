(define (problem bathroom_put_plunger_in_cabinet)
  (:domain put_task)

  (:objects
    agent1 - agent
    plunger1 - object
    toiletbrush1 - object
    sinkcabinet1 - receptacle
  )

  (:init
    ;; agent starts not at any object's location and holds nothing
    (not (holdsAny agent1))

    ;; cabinet under sink is an openable receptacle; appears closed
    (openable sinkcabinet1)
    (not (opened sinkcabinet1))

    ;; objects beside the toilet (not inside any receptacle)
    (not (inReceptacle plunger1 sinkcabinet1))
    (not (inReceptacle toiletbrush1 sinkcabinet1))
  )

  (:goal
    (and
      (inReceptacle plunger1 sinkcabinet1)
    )
  )
)