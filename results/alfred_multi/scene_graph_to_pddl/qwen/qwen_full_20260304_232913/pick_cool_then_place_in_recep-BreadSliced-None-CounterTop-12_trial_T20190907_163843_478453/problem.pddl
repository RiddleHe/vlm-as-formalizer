(define (problem cut_bread_and_fridge)
    (:domain put_task)
    (:objects
        agent
        fridge - receptacle
        sink - receptacle
        microwave - receptacle
        knife - object
        loaf_of_bread - object
        red_apple - object
        counter_top - object
        stove_top - object
        black_pan - object
        black_toaster - object
        wooden_cabinet - object
        green_cabbage - object
        brown_potato - object
        silver_spoon - object
        silver_knife - object
        golden_knife - object
    )
    (:init
        (openable fridge)
        (not (opened fridge))
        (isOn black_toaster)
        (isToggled black_toaster)
        (inReceptacle loaf_of_bread counter_top)
        (inReceptacle red_apple counter_top)
        (inReceptacle green_cabbage counter_top)
        (inReceptacle brown_potato counter_top)
        (inReceptacle silver_spoon counter_top)
        (inReceptacle silver_knife counter_top)
        (inReceptacle golden_knife counter_top)
        (inReceptacle black_pan stove_top)
        (not (holdsAny agent))
        (not (atLocation agent counter_top))
        (not (atLocation agent fridge))
        (not (isSliced loaf_of_bread))
        (not (isCool loaf_of_bread))
    )
    (:goal
        (and
            (inReceptacle loaf_of_bread counter_top)
            (isSliced loaf_of_bread)
            (isCool loaf_of_bread)
        )
    )
)