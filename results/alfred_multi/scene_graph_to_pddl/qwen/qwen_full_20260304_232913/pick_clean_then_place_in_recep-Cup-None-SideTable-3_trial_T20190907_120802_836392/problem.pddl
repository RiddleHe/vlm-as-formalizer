(define (problem put_clean_mug_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        green_glass - object
        silver_toaster - object
        brown_bread_loaf - object
        black_pot - object
        silver_potted_plant - object
        clear_glass - object
        copper_pepper_shaker - object
        wooden_countertop - receptacle
        black_cabinet - receptacle
    )
    (:init
        (openable microwave)
        (openable fridge)
        (inReceptacle knife sink)
        (inReceptacle clear_glass microwave)
        (inReceptacle copper_pepper_shaker microwave)
        (inReceptacle green_glass wooden_countertop)
        (inReceptacle silver_toaster wooden_countertop)
        (inReceptacle brown_bread_loaf wooden_countertop)
        (inReceptacle black_pot wooden_countertop)
        (inReceptacle silver_potted_plant wooden_countertop)
        (not (isClean clear_glass))
        (not (isClean green_glass))
        (not (isClean knife))
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle clear_glass wooden_countertop)
        (isClean clear_glass)
    ))
)