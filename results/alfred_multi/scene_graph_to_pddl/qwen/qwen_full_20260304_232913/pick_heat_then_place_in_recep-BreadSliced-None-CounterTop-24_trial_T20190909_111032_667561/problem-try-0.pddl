(define (problem put_warm_slice_of_bread)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink_left - receptacle
        sink_right - receptacle
        trash_can - receptacle
        knife_with_yellow_handle - knife
        knife_with_black_handle - knife
        apple - object
        wine_glass - object
        salt_shaker - object
        bread_slice - object
        toaster - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink_left)
        (openable sink_right)
        (opened microwave)
        (isOn toaster)
        (isToggled toaster)
        (inReceptacle bread_slice microwave)
        (inReceptacle knife_with_yellow_handle sink_right)
        (atLocation agent microwave) ; assuming agent starts near microwave as bread is there
    )
    (:goal
        (and
            (isHot bread_slice)
            (isSliced bread_slice)
            (inReceptacle bread_slice sink_left) ; assuming "counter in front of the sink" means sink_left counter
        )
    )
)