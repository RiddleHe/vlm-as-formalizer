(define (problem examine_cell_phone)
    (:domain put_task)
    (:objects
        agent1 - agent
        dark_wooden_cabinet_left - receptacle
        dark_wooden_cabinet_right - receptacle
        golden_bucket - receptacle
        tall_lamp_with_green_shade - object
        cell_phone - object
    )
    (:init
        (openable dark_wooden_cabinet_left)
        (openable dark_wooden_cabinet_right)
        (isOn tall_lamp_with_green_shade)
        (isToggled tall_lamp_with_green_shade)
        (inReceptacle cell_phone dark_wooden_cabinet_left)
    )
    (:goal (and
        (atLocation agent1 tall_lamp_with_green_shade)
        (holds agent1 cell_phone)
    ))
)