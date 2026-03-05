(define (problem cut_bread_and_fridge)
    (:domain put_task)
    (:objects
        robot - agent
        dark_brown_fridge - fridge
        black_toaster - receptacle
        black_pot_on_stove - receptacle
        wooden_cabinet_under_counter - receptacle
        loaf_of_bread - object
        red_apple - object
        silver_knife - knife
        silver_spoon - object
        green_cabbage - object
        brown_potato - object
    )
    (:init
        (openable dark_brown_fridge)
        (not (opened dark_brown_fridge))
        (not (holdsAny robot))
        (not (atLocation robot loaf_of_bread))
        (not (atLocation robot red_apple))
        (not (atLocation robot silver_knife))
        (not (atLocation robot dark_brown_fridge))
        (isOn black_toaster)
        (isOn black_pot_on_stove)
        (not (isSliced loaf_of_bread))
        (not (isCool loaf_of_bread))
        (not (inReceptacle loaf_of_bread dark_brown_fridge))
        (not (inReceptacle loaf_of_bread black_toaster))
        (not (inReceptacle loaf_of_bread black_pot_on_stove))
        (not (inReceptacle loaf_of_bread wooden_cabinet_under_counter))
        (atLocation robot silver_knife) ; assuming robot starts near knife for task initiation
    )
    (:goal
        (and
            (isSliced loaf_of_bread)
            (inReceptacle loaf_of_bread dark_brown_fridge)
            (not (inReceptacle loaf_of_bread dark_brown_fridge)) ; removed from fridge
            (atLocation robot loaf_of_bread)
            (atLocation robot red_apple)
            (not (holdsAny robot))
        )
    )
)