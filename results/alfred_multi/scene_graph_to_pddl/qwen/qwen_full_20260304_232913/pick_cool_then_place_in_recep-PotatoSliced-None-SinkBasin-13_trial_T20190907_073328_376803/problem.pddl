(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        cabinet - receptacle
        tomato - object
        potato - object
        spoon - object
        fork - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (openable cabinet)
        (opened cabinet)
        (inReceptacle fork sink)
        (inReceptacle tomato sink)
        (inReceptacle spoon cabinet)
        (inReceptacle potato cabinet)
        (atLocation robot cabinet)  ; robot starts at cabinet based on scene
    )
    (:goal
        (and
            (inReceptacle potato sink)
            (isCool potato)
            (isSliced potato)
            (inReceptacle knife fridge)
        )
    )
)