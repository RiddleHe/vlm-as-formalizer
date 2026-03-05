(define (problem examine_trophy_with_lamp)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife
        black_table
        black_statue_trophy
        lamp_base
        lamp_pole
    )
    (:init
        (atLocation agent black_table)  ; agent starts at black_table based on scene
        (inReceptacle black_statue_trophy black_table)
        (not (holdsAny agent))
        (not (isOn lamp_base))
        (not (isToggled lamp_base))
        (not (isClean black_statue_trophy))
        (not (isHot black_statue_trophy))
        (not (isCool black_statue_trophy))
        (not (isSliced black_statue_trophy))
    )
    (:goal
        (and
            (atLocation agent lamp_base)
            (isOn lamp_base)
            (atLocation agent black_statue_trophy)
        )
    )
)