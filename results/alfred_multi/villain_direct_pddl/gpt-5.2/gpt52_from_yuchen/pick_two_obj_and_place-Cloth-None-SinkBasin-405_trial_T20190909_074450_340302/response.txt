(define (problem put_task_bathrag_to_sink)
  (:domain put_task)

  (:objects
    robot - agent
    bathtub - receptacle
    sink - sink
    rag - object
  )

  (:init
    ;; receptacle relations from the scene
    (inReceptacle rag bathtub)

    ;; robot initially not at any object's location (per instruction)
  )

  (:goal
    (and
      (inReceptacle rag sink)
    )
  )
)