(define (problem put_warm_slice_of_bread)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink_left sink_right - receptacle
        knife_with_yellow_handle knife_with_black_handle - knife
        trash_can toaster - receptacle
        apple wine_glass salt_shaker bread_slice - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink_left)
        (openable sink_right)
        (opened microwave)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle bread_slice toaster)
        (inReceptacle knife_with_yellow_handle sink_left)
        (inReceptacle apple sink_right)
        (atLocation agent microwave)
    )
    (:goal (and
        (inReceptacle bread_slice sink_left)  ; assuming "counter in front of the sink" refers to sink_left area
        (isHot bread_slice)
        (isSliced bread_slice)
    ))
)