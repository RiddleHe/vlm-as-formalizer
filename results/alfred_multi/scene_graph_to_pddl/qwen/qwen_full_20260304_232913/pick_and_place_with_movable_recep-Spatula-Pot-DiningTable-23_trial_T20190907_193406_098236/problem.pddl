(define (problem put_pot_with_spatula_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        table - receptacle
        chair - object
        pot1 - object
        pot2 - object
        tray - object
        plate - object
        shelf - receptacle
    )
    (:init
        (openable shelf)
        (opened shelf)
        (inReceptacle tray shelf)
        (inReceptacle plate shelf)
        (inReceptacle pot1 shelf)
        (isOn pot1)
        (isOn pot2)
        (atLocation robot table)
    )
    (:goal (and
        (inReceptacle pot1 table)
        (inReceptacle tray table)
    ))
)