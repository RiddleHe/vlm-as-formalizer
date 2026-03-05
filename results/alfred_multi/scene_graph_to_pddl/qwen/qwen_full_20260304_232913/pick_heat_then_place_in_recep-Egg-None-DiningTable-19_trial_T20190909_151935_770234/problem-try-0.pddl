(define (problem cooked_egg_on_table)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        sink - receptacle
        table - receptacle
        knife - object
        egg - object
        fork - object
        mug - object
        book - object
        bowl - object
        coffee_maker - object
        spatula - object
        apple - object
    )
    (:init
        (openable microwave)
        (openable sink)
        (not (opened microwave))
        (not (opened sink))
        (inReceptacle mug sink)
        (inReceptacle egg sink)
        (inReceptacle book sink)
        (inReceptacle fork sink)
        (isOn coffee_maker)
        (atLocation agent table) ; Assuming agent starts at table as it's central
    )
    (:goal (and
        (inReceptacle egg table)
        (isHot egg)
    ))
)