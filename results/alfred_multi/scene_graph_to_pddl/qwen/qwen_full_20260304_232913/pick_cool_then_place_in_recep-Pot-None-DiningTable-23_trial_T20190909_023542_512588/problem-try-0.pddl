(define (problem put_chilled_bowl_on_table)
    (:domain put_task)
    (:objects
        agent
        black_fridge - fridge
        green_tablecloth_table - receptacle
        silver_metal_bowl - receptacle
        green_cabbage - object
        red_tomato - object
        brown_frying_pan - object
        silver_cup - object
        silver_cup_2 - object
    )
    (:init
        (openable black_fridge)
        (not (opened black_fridge))
        (inReceptacle green_cabbage green_tablecloth_table)
        (inReceptacle red_tomato green_tablecloth_table)
        (inReceptacle brown_frying_pan green_tablecloth_table)
        (inReceptacle silver_cup silver_metal_bowl)
        (inReceptacle silver_cup_2 silver_metal_bowl)
        (not (holdsAny agent))
        (not (atLocation agent black_fridge))
        (not (atLocation agent green_tablecloth_table))
        (not (atLocation agent silver_metal_bowl))
        (not (isCool silver_metal_bowl))
    )
    (:goal
        (and
            (inReceptacle silver_metal_bowl green_tablecloth_table)
            (isCool silver_metal_bowl)
        )
    )
)