(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        bathtub - receptacle
        beige_oval_sink - sink
        red_rag - object
        pink_sponge_in_bathtub - object
        pink_sponge_in_sink - object
    )
    (:init
        (atLocation agent1 bathtub)
        (inReceptacle red_rag bathtub)
        (inReceptacle pink_sponge_in_bathtub bathtub)
        (inReceptacle pink_sponge_in_sink beige_oval_sink)
    )
    (:goal (and
        (inReceptacle red_rag beige_oval_sink)
        (inReceptacle pink_sponge_in_bathtub beige_oval_sink)
    ))
)