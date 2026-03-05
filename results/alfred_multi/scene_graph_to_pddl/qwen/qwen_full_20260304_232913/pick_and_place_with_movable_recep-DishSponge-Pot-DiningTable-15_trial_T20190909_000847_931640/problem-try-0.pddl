(define (problem put_pot_with_sponge_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        brown_microwave - microwave
        white_cabinet_left - receptacle
        white_cabinet_right - receptacle
        white_cabinet_middle - receptacle
        silver_knife - knife
        copper_pot_on_stove - object
        copper_pot_on_stove_right - object
        red_tomato - object
        brown_egg - object
        white_table - object
        wooden_stool - object
    )
    (:init
        (openable white_cabinet_left)
        (openable white_cabinet_right)
        (openable white_cabinet_middle)
        (openable brown_microwave)
        (isOn brown_microwave)
        (isToggled brown_microwave)
    )
    (:goal (and
        (inReceptacle copper_pot_on_stove white_table)
    ))
)