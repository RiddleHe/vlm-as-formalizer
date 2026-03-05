(define (problem pick_pillow_and_turn_on_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_side_table - receptacle
        brown_armchair - receptacle
        pink_lamp - object
        white_lampshade - object
        decorative_figurines - object
        patterned_pillow - object
    )
    (:init
        (openable wooden_side_table)
        (openable brown_armchair)
        (inReceptacle patterned_pillow brown_armchair)
        (inReceptacle pink_lamp wooden_side_table)
        (inReceptacle white_lampshade wooden_side_table)
        (inReceptacle decorative_figurines wooden_side_table)
    )
    (:goal (and
        (holds robot patterned_pillow)
        (isOn pink_lamp)
    ))
)