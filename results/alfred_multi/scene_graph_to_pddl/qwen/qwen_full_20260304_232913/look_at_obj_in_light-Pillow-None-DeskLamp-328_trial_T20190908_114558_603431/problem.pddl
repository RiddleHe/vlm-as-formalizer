(define (problem look_at_cushion_by_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        pink_patterned_cushion - object
        silver_laptop - object
        brown_teddy_bear - object
        green_lamp - object
        black_mug - object
        wooden_desk - receptacle
        blue_bed - receptacle
        book_titled_Superfoods_for_Life - object
        tennis_racket - object
        smartphone1 - object
        smartphone2 - object
    )
    (:init
        (openable wooden_desk)
        (openable blue_bed)
        (isOn green_lamp)
        (isToggled green_lamp)
        (inReceptacle pink_patterned_cushion blue_bed)
        (inReceptacle silver_laptop blue_bed)
        (inReceptacle brown_teddy_bear blue_bed)
        (inReceptacle book_titled_Superfoods_for_Life blue_bed)
        (inReceptacle black_mug wooden_desk)
        (inReceptacle green_lamp wooden_desk)
        (not (atLocation robot pink_patterned_cushion))
        (not (atLocation robot green_lamp))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (atLocation robot pink_patterned_cushion)
            (atLocation robot green_lamp)
        )
    )
)