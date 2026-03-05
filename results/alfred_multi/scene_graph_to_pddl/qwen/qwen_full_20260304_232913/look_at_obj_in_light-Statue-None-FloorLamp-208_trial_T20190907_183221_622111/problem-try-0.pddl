(define (problem examine_trophy_with_lamp)
    (:domain put_task)
    (:objects
        agent
        dark_wooden_table - receptacle
        black_statue_trophy - object
        lamp_base - object
        lamp_stand - object
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
    )
    (:init
        (atLocation agent dark_wooden_table)
        (inReceptacle black_statue_trophy dark_wooden_table)
        (openable dark_wooden_table)
        (not (opened dark_wooden_table))
        (not (holdsAny agent))
        (not (isClean black_statue_trophy))
        (not (isHot black_statue_trophy))
        (not (isCool black_statue_trophy))
        (not (isOn lamp_base))
        (not (isToggled lamp_base))
        (not (isSliced black_statue_trophy))
    )
    (:goal
        (and
            (atLocation agent black_statue_trophy)
            (atLocation agent lamp_base)
            (isOn lamp_base)
        )
    )
)