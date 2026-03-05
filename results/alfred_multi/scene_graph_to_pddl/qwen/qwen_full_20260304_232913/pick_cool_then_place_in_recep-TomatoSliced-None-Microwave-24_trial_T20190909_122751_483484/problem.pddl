(define (problem put_cold_tomato_in_microwave)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink_left - receptacle
        sink_right - receptacle
        knife_on_counter - knife
        toaster - receptacle
        bowl_on_counter - object
        wineglass_on_counter - object
        tomato_in_microwave - object
        fork_in_sink - object
        spoon_in_sink - object
        saltshaker_on_counter - object
        bottle_on_counter - object
        plate_on_counter - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (opened microwave)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle tomato_in_microwave microwave)
        (inReceptacle fork_in_sink sink_right)
        (inReceptacle spoon_in_sink sink_left)
    )
    (:goal (and
        (inReceptacle tomato_in_microwave microwave)
        (isCool tomato_in_microwave)
    ))
)