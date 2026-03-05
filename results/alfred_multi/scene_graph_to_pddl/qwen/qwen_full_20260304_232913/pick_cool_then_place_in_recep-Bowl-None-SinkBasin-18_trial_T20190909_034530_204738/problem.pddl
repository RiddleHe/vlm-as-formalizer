(define (problem put_chilled_bowl_in_sink)
    (:domain put_task)
    (:objects
        agent - agent
        fridge - fridge
        sink - sink
        black_bowl - object
        table - object
    )
    (:init
        (openable fridge)
        (openable sink)
        (inReceptacle black_bowl table)
        (atLocation agent table)
    )
    (:goal
        (and
            (inReceptacle black_bowl sink)
            (isCool black_bowl)
        )
    )
)