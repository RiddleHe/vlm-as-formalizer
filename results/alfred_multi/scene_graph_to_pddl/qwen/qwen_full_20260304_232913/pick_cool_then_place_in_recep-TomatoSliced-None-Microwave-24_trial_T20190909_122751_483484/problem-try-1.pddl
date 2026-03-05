(define (problem put_cold_tomato_in_microwave)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink_left - receptacle
        sink_right - receptacle
        knife_on_counter - knife
        knife_in_sink - knife
        tomato - object
        bowl - object
        wine_glass - object
        plate - object
        fork - object
        spoon - object
        toaster - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (opened microwave)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle tomato microwave)
        (inReceptacle knife_in_sink sink_right)
        (inReceptacle fork sink_right)
        (inReceptacle spoon sink_left)
        (inReceptacle plate sink_left)
        (inReceptacle bowl counter_right)
        (inReceptacle wine_glass counter_right)
    )
    (:goal (and
        (inReceptacle tomato microwave)
        (isCool tomato)
    ))
)