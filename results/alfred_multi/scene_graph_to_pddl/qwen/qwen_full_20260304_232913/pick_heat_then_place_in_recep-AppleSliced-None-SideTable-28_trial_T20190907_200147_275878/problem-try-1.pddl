(define (problem cut_cook_apple)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife_on_sink
        knife_on_table
        apple_on_sink
        apple_on_table
        apple_on_shelf
        black_table
        brown_table
        black_shelf
        purple_cup
        grey_plate
        white_saltshaker
        black_vase
        bread_on_table
        green_lettuce
        spoon_on_table
        spoon_on_sink
        fork_on_sink
        fork_on_table
        tomato_on_sink
        tomato_on_table
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (opened microwave)
        (opened fridge)
        (opened sink)
        (isOn microwave)
        (isOn sink)
        (isOn fridge)
        (isToggled microwave)
        (isToggled sink)
        (isToggled fridge)
        (inReceptacle purple_cup black_table)
        (inReceptacle grey_plate black_table)
        (inReceptacle white_saltshaker black_table)
        (inReceptacle spoon_on_table black_table)
        (inReceptacle bread_on_table black_table)
        (inReceptacle green_lettuce black_table)
        (inReceptacle apple_on_sink sink)
        (inReceptacle knife_on_sink sink)
        (inReceptacle tomato_on_sink sink)
        (inReceptacle fork_on_sink sink)
        (inReceptacle apple_on_table black_shelf)
        (inReceptacle knife_on_table black_shelf)
        (inReceptacle white_saltshaker black_shelf)
        (inReceptacle black_vase brown_table)
        (inReceptacle bread_on_table brown_table)
        (inReceptacle spoon_on_table brown_table)
        (inReceptacle fork_on_table brown_table)
        (inReceptacle tomato_on_table brown_table)
    )
    (:goal (and
        (isSliced apple_on_sink)
        (isHot apple_on_sink)
        (inReceptacle apple_on_sink black_shelf)
    ))
)