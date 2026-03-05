(define (problem move_salt_shakers_to_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        black_cabinet_under_counter - receptacle
        black_cabinet_under_counter_with_pot_inside - receptacle
        black_fridge - receptacle
        stainless_steel_sink - receptacle
        black_knife - knife
        green_book - object
        black_pot - object
        tomato - object
        salt_shaker - object
        pepper_shaker - object
        potted_plant - object
        loaf_of_bread - object
        green_apple - object
    )
    (:init
        (openable black_cabinet_under_counter)
        (openable black_cabinet_under_counter_with_pot_inside)
        (openable black_fridge)
        (opened black_cabinet_under_counter_with_pot_inside)
        (inReceptacle black_pot black_cabinet_under_counter_with_pot_inside)
        (atLocation robot black_cabinet_under_counter_with_pot_inside) ; robot starts at the opened cabinet
    )
    (:goal (and
        (inReceptacle salt_shaker black_cabinet_under_counter)
        (inReceptacle pepper_shaker black_cabinet_under_counter)
    ))
)