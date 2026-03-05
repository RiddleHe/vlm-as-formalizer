(define (problem examine_trophy_with_lamp)
    (:domain put_task)
    (:objects
        agent1 - agent
        trophy - object
        lamp - object
        table - receptacle
    )
    (:init
        (atLocation agent1 table)
        (inReceptacle trophy table)
        (inReceptacle lamp table)
        (not (holdsAny agent1))
    )
    (:goal (and
        (atLocation agent1 trophy)
        (holds agent1 trophy)
        (atLocation agent1 lamp)
    ))
)