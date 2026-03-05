(define (problem clean_spoon)
    (:domain put_task)
    (:objects
        robot - agent
        dark_red_microwave - microwave
        double_basin_sink - sink
        spoon - object
    )
    (:init
        (openable dark_red_microwave)
        (openable double_basin_sink)
        (not (opened dark_red_microwave))
        (not (opened double_basin_sink))
        (not (holdsAny robot))
        (not (isClean spoon))
        (not (isHot spoon))
        (not (isCool spoon))
        (not (isOn dark_red_microwave))
        (not (isToggled dark_red_microwave))
        (not (isSliced spoon))
        (not (holds robot spoon))
        (not (atLocation robot dark_red_microwave))
        (not (atLocation robot double_basin_sink))
        (not (atLocation robot spoon))
        (not (inReceptacle spoon dark_red_microwave))
        (not (inReceptacle spoon double_basin_sink))
    )
    (:goal (and
        (isClean spoon)
        (inReceptacle spoon double_basin_sink)
    ))
)