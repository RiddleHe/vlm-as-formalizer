(define (problem put_pot_with_spatula_on_table)
    (:domain put_task)
    (:objects
        robot1 - agent

        table - receptacle
        pot1 pot2 - receptacle
        spatula1 - object
        knife1 - knife
        plate1 plate2 - receptacle
        stove - receptacle
        chair1 chair2 - object
        shelf - receptacle
        towel - object
    )
    (:init
        ;; robot starts not at any location
        ;; Table and stove are receptacles that can hold objects
        ; (inReceptacle plate1 table)
        ; (inReceptacle knife1 table)
        ; (inReceptacle plate2 table)
        ; (inReceptacle towel shelf)

        ; (inReceptacle pot1 stove)
        ; (inReceptacle pot2 stove)

        ; (inReceptacle spatula1 shelf)

        ;; all receptacles are not openable unless specified (table, stove, pots, shelf)
    )
    (:goal (and
        (inReceptacle pot1 table)
        (inReceptacle spatula1 pot1)
    ))
)