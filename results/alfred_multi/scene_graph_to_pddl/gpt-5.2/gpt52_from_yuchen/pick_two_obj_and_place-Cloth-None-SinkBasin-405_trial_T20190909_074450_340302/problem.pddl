(define (problem put_task_bathroom_rag_to_sink)
  (:domain put_task)
  (:objects
    agent_robot - agent
    bathtub_white - receptacle
    sink_bathroom_oval_basin - sink
    rag_red_in_bathtub - object
    soap_bar_pink_left_in_bathtub - object
    soap_bar_pink_right_in_bathtub - object
    soap_bar_pink_in_sink - object
  )
  (:init
    ;; agent starts not at any location (no atLocation facts)

    ;; objects in receptacles
    (inReceptacle rag_red_in_bathtub bathtub_white)
    (inReceptacle soap_bar_pink_left_in_bathtub bathtub_white)
    (inReceptacle soap_bar_pink_right_in_bathtub bathtub_white)
    (inReceptacle soap_bar_pink_in_sink sink_bathroom_oval_basin)
  )
  (:goal
    (and
      (inReceptacle rag_red_in_bathtub sink_bathroom_oval_basin)
    )
  )
)