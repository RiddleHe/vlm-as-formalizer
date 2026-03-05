(define (problem bathroom_rag_to_sink)
  (:domain put_task)

  (:objects
    robot - agent
    bathtub - receptacle
    bathroom_sink - sink
    rag1 - object
    soap_tub1 - object
    soap_tub2 - object
    soap_sink1 - object
  )

  (:init
    ;; receptacles and their contents
    (inReceptacle rag1 bathtub)
    (inReceptacle soap_tub1 bathtub)
    (inReceptacle soap_tub2 bathtub)
    (inReceptacle soap_sink1 bathroom_sink)
  )

  (:goal
    (and
      (inReceptacle rag1 bathroom_sink)
    )
  )
)