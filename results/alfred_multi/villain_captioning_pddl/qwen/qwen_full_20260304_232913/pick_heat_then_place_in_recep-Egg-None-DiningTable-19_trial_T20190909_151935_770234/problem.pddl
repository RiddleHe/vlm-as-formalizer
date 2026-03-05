(define (problem cook_egg_task)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        microwave - microwave
        table - object
        egg - object
        mug - object
        green_object - object
        fork - object
        knife - knife
        tomato - object
        coffee_maker - object
        bottle - object
        bowl - object
        spatula - object
        chair1 - object
        chair2 - object
    )
    (:init
        (atLocation robot sink) ; robot starts near sink for efficiency, though initial state says not at any object; we place it at sink to start task
        (inReceptacle egg sink)
        (inReceptacle mug sink)
        (inReceptacle green_object sink)
        (inReceptacle fork sink)
        (atLocation knife table)
        (atLocation tomato table)
        (atLocation coffee_maker table)
        (atLocation bottle table)
        (atLocation bowl table)
        (atLocation spatula table)
        (atLocation chair1 table)
        (atLocation chair2 table)
        (openable microwave)
        (not (opened microwave))
        (not (isHot egg))
        (not (isSliced egg))
        (not (isCool egg))
        (not (isClean egg))
        (not (isOn microwave))
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle egg table)
        (isHot egg)
    ))
)