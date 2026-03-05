(define (problem cut_cook_apple)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife_on_sink
        knife_on_table
        black_table
        white_table
        black_cup
        gray_plate
        salt_shaker
        brown_bread
        green_apple
        red_apple
        tomato
        black_bowl
        toaster
        dishwasher
        cabinet
        fork
        spoon
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (openable dishwasher)
        (openable cabinet)
        (opened microwave)
        (opened fridge)
        (opened sink)
        (opened dishwasher)
        (opened cabinet)
        (isOn toaster)
        (isOn dishwasher)
        (isToggled toaster)
        (isToggled dishwasher)
        (inReceptacle knife_on_sink sink)
        (inReceptacle fork sink)
        (inReceptacle black_cup black_table)
        (inReceptacle gray_plate black_table)
        (inReceptacle salt_shaker black_table)
        (inReceptacle brown_bread black_table)
        (inReceptacle green_apple black_table)
        (inReceptacle red_apple black_table)
        (inReceptacle tomato sink)
        (inReceptacle black_bowl white_table)
        (inReceptacle brown_bread white_table)
        (inReceptacle red_apple sink)
        (inReceptacle knife_on_table black_table)
        (atLocation agent black_table)
    )
    (:goal (and
        (isSliced red_apple)
        (isHot red_apple)
        (inReceptacle red_apple white_table)
    ))
)