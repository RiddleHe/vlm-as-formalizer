(define (problem clean_mug_task)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink1 - sink
        countertop1 - receptacle
        mug1 - object
        knife1 - knife
    )
    (:init
        (atLocation agent1 countertop1) ; Assuming agent starts near countertop for simplicity, as not specified
        (inReceptacle mug1 countertop1)
        (inReceptacle knife1 sink1)
        (not (isClean mug1))
        (not (holdsAny agent1))
        (not (opened microwave1)) ; microwave is not used but included for completeness
        (not (opened fridge1))     ; fridge is not used but included for completeness
    )
    (:goal (and
        (inReceptacle mug1 countertop1)
        (isClean mug1)
    ))
)