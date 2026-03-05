(define (problem put_heated_apple_on_table)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        apple_on_table
        knife_on_table
        plate_on_table
        pan_on_table
        book_on_table
        fork_on_table
        spoon_on_table
        red_pen_on_table
        spatula_on_table
        brown_bread_on_table
        small_brown_object_on_table
        mug_under_table
        black_bowl_under_table
        cabbage_on_table
        wine_bottle_on_table
        knife_in_knife_block
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (not (opened microwave))
        (not (opened fridge))
        (not (opened sink))
        (inReceptacle mug_under_table sink)
        (inReceptacle black_bowl_under_table sink)
        (not (holdsAny agent))
        (not (isClean apple_on_table))
        (not (isHot apple_on_table))
        (not (isCool apple_on_table))
        (not (isOn apple_on_table))
        (not (isToggled apple_on_table))
        (not (isSliced apple_on_table))
        (atLocation agent apple_on_table) ; assuming agent starts near apple for simplicity, as no initial location is specified
    )
    (:goal
        (and
            (isHot apple_on_table)
            (atLocation agent apple_on_table)
            (not (holdsAny agent))
        )
    )
)