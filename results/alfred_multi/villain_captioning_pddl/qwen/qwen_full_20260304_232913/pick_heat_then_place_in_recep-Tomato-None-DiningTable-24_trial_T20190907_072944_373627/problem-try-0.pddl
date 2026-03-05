(define (problem put_heated_tomato_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        tomato - object
        microwave - microwave
        table - object
        countertop - object
        trash_can - receptacle
        sink - sink
        knife - knife
    )
    (:init
        (atLocation robot countertop)
        (inReceptacle tomato countertop)
        (openable microwave)
        (not (opened microwave))
        (not (isHot tomato))
        (not (isOn microwave))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle tomato table)
            (isHot tomato)
        )
    )
)