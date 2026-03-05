(define (problem put_heated_potato_in_sink)
    (:domain put_task)
    (:objects
        robot - agent
        brown_microwave_on_counter - microwave
        stainless_steel_sink_with_two_basins - sink
        potato_in_sink - object
        egg_in_sink - object
        lettuce_in_sink - object
        knife_on_counter - knife
    )
    (:init
        (openable brown_microwave_on_counter)
        (opened brown_microwave_on_counter)
        (isOn brown_microwave_on_counter)
        (isToggled brown_microwave_on_counter)
        (isClean potato_in_sink)
        (isClean egg_in_sink)
        (isClean lettuce_in_sink)
        (inReceptacle potato_in_sink stainless_steel_sink_with_two_basins)
        (inReceptacle egg_in_sink stainless_steel_sink_with_two_basins)
        (inReceptacle lettuce_in_sink stainless_steel_sink_with_two_basins)
    )
    (:goal (and
        (inReceptacle potato_in_sink stainless_steel_sink_with_two_basins)
        (isHot potato_in_sink)
    ))
)