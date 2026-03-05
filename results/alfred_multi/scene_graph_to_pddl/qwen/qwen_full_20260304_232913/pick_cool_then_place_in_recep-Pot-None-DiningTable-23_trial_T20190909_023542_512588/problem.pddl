(define (problem put_chilled_bowl_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        black_fridge - fridge
        green_tablecloth - receptacle
        stove_top - receptacle
        oven - receptacle
        trash_can - receptacle
        silver_metal_bowl - object
        brown_frying_pan - object
        green_cabbage - object
        red_tomato - object
    )
    (:init
        (openable black_fridge)
        (opened black_fridge)
        (isOn stove_top)
        (inReceptacle silver_metal_bowl stove_top)
        (inReceptacle brown_frying_pan stove_top)
    )
    (:goal (and
        (inReceptacle silver_metal_bowl green_tablecloth)
        (isCool silver_metal_bowl)
    ))
)