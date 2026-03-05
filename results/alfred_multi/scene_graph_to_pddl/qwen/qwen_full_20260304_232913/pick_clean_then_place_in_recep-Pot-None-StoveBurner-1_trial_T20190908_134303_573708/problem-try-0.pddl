(define (problem put_pot_on_stove)
    (:domain put_task)
    (:objects
        robot - agent
        stove_top - receptacle
        oven - receptacle
        sink - receptacle
        pot_with_water - object
        empty_pot - object
        white_mug - object
        knife - object
    )
    (:init
        (openable sink)
        (openable oven)
        (isOn stove_top)
        (inReceptacle pot_with_water stove_top)
        (inReceptacle empty_pot stove_top)
        (inReceptacle white_mug stove_top) ; corrected to match scene graph (though image shows mug on countertop, scene graph says stove_top)
        (atLocation robot stove_top) ; assuming robot starts at stove for interaction, as no initial location is specified
    )
    (:goal (and
        (inReceptacle pot_with_water stove_top)
    ))
)