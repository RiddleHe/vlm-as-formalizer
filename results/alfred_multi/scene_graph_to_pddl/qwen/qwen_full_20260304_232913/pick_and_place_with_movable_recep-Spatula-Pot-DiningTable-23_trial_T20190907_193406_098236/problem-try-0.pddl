(define (problem put_pot_with_spatula_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        shelf_under_table - receptacle
        table - object
        chair - object
        oven_with_pots - object
        brown_pan - object
        metal_pot1 - object
        metal_pot2 - object
    )
    (:init
        (openable shelf_under_table)
        (not (opened shelf_under_table))
        (isOn oven_with_pots)
        (isToggled oven_with_pots)
        (inReceptacle brown_pan shelf_under_table)
        (inReceptacle metal_pot1 oven_with_pots)
        (inReceptacle metal_pot2 oven_with_pots)
        (atLocation robot table)
    )
    (:goal
        (and
            (inReceptacle brown_pan table)
            (inReceptacle metal_pot1 table)
        )
    )
)