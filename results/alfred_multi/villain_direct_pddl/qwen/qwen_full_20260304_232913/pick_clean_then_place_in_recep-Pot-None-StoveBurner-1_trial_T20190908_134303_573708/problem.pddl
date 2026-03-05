(define (problem put_pot_on_stove)
    (:domain put_task)
    (:objects
        robot - agent
        stove - receptacle
        pot1 pot2 - object
        sink - sink
        countertop - receptacle
        mug - object
    )
    (:init
        (atLocation robot countertop)
        (inReceptacle pot1 countertop)
        (inReceptacle pot2 stove)
        (inReceptacle mug countertop)
        (isOn stove)
        (isClean pot1)
    )
    (:goal (and (inReceptacle pot1 stove)))
)