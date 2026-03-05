(define (problem put_heated_tomato_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        tomato - object
        microwave - microwave
        table - object
        knife - knife
        sink - sink
        fridge - fridge
        apple - object
        saltshaker - object
        fork - object
        plate - object
        trashcan - receptacle
    )
    (:init
        (atLocation robot tomato)
        (openable microwave)
        (not (opened microwave))
        (not (isHot tomato))
        (not (isClean tomato))
        (not (isSliced tomato))
        (not (isOn microwave))
        (not (holdsAny robot))
        (not (holds robot tomato))
        (inReceptacle tomato trashcan)
        (inReceptacle apple table)
        (inReceptacle saltshaker table)
        (inReceptacle fork table)
        (inReceptacle plate table)
        (inReceptacle knife table)
    )
    (:goal
        (and
            (inReceptacle tomato table)
            (isHot tomato)
        )
    )
)