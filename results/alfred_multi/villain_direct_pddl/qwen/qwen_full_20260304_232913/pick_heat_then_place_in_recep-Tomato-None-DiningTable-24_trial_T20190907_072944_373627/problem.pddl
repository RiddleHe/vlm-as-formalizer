(define (problem put_heated_tomato_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        tomato - object
        microwave - microwave
        table - object
        knife - knife
        fork - object
        apple - object
        saltshaker - object
        spatula - object
        trashcan - receptacle
        sink - sink
    )
    (:init
        (atLocation robot tomato)
        (inReceptacle tomato trashcan)
        (inReceptacle fork trashcan)
        (inReceptacle apple trashcan)
        (inReceptacle saltshaker trashcan)
        (inReceptacle spatula trashcan)
        (openable microwave)
        (not (opened microwave))
        (not (isHot tomato))
        (not (isClean tomato))
        (not (isSliced tomato))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle tomato table)
            (isHot tomato)
        )
    )
)