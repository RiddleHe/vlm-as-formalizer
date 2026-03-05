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
        (openable trash_bin)
        (opened microwave)
        (opened fridge)
        (inReceptacle apple microwave)
        (inReceptacle egg microwave)
        (inReceptacle knife microwave)
        (atLocation agent microwave)  ; agent starts at microwave as per scene
    )
    (:goal (and
        (inReceptacle apple trash_bin)
        (isCool apple)
    ))
)