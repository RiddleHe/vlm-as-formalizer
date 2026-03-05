(define (problem put_plate_knife_apple_in_fridge)
    (:domain put_task)
    (:objects
        agent
        red_microwave - microwave
        black_fridge - fridge
        sink - sink
        knife_on_countertop - knife
        black_bowl - receptacle
        blue_plate - receptacle
        green_plate - receptacle
        black_cup - receptacle
        red_cup - receptacle
        black_pan - receptacle
        apple_piece - object
        lettuce - object
        bread_loaf - object
        salt_shaker - object
        photos - object
        countertop - receptacle
    )
    (:init
        (openable red_microwave)
        (openable black_fridge)
        (isOn red_microwave)
        (isToggled red_microwave)
        (inReceptacle black_cup red_microwave)
        (inReceptacle red_cup red_microwave)
        (inReceptacle apple_piece red_microwave)
        (inReceptacle knife_on_countertop countertop)
        (inReceptacle lettuce countertop)
        (inReceptacle photos countertop)
        (inReceptacle black_bowl countertop)
        (inReceptacle salt_shaker countertop)
        (inReceptacle blue_plate countertop)
        (inReceptacle green_plate countertop)
        (inReceptacle bread_loaf countertop)
        (atLocation agent red_microwave)
    )
    (:goal
        (and
            (inReceptacle blue_plate black_fridge)
            (inReceptacle knife_on_countertop black_fridge)
            (inReceptacle apple_piece black_fridge)
        )
    )
)