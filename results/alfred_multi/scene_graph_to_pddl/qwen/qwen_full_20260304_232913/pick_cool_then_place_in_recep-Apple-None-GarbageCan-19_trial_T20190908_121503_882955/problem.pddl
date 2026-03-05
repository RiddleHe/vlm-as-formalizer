(define (problem chill_apple_and_put_in_bin)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        trash_bin - receptacle
        apple - object
        egg - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (inReceptacle apple microwave)
        (inReceptacle egg microwave)
        (inReceptacle knife microwave)
        (atLocation agent microwave)
    )
    (:goal (and
        (inReceptacle apple trash_bin)
        (isCool apple)
    ))
)