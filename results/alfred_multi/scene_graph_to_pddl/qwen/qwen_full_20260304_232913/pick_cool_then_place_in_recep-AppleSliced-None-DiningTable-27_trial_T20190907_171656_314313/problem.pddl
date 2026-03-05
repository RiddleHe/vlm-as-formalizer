(define (problem chill_apple)
    (:domain put_task)
    (:objects
        robot - agent
        black_toaster_oven - microwave
        black_refrigerator - fridge
        white_sink - sink
        silver_knife - knife
        white_table - receptacle
        red_apple_on_countertop - object
        yellow_apple_on_table - object
        red_tomato_on_table - object
        green_lettuce_on_table - object
        brown_bottle_on_countertop - object
        wine_glass_on_table - object
        salt_shaker_on_table - object
        pepper_shaker_on_table - object
        plate_on_table - object
    )
    (:init
        (openable black_toaster_oven)
        (openable black_refrigerator)
        (openable white_sink)
        (isOn black_toaster_oven)
        (inReceptacle red_apple_on_countertop black_toaster_oven)
        (atLocation robot white_table) ; Assuming robot starts near the table for simplicity, as no initial location is specified
    )
    (:goal (and
        (isCool yellow_apple_on_table)
        (inReceptacle yellow_apple_on_table white_table)
    ))
)