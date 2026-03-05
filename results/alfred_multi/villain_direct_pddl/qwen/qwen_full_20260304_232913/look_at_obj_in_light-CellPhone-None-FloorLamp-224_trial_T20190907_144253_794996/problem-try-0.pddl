(define (problem examine_cell_phone)
    (:domain put_task)
    (:objects
        robot - agent
        cell_phone - object
        tall_lamp - object
    )
    (:init
        (atLocation robot tall_lamp)
        (isOn tall_lamp)  ; assume lamp is on for "light"
    )
    (:goal (and ) )  ; no valid goal can be expressed in this domain for "examine"
)