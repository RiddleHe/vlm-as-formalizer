(define (problem place_rinsed_soap_in_drawer)
    (:domain put_task)
    (:objects
        agent1 - agent
        cabinet1 - receptacle
        drawer1 drawer2 drawer3 - receptacle
        sink1 - receptacle
        soap1 soap2 - object
        yellow_bottle brown_pump_bottle toilet_paper - object
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation agent1 cabinet1))
        (not (atLocation agent1 drawer1))
        (not (atLocation agent1 drawer2))
        (not (atLocation agent1 drawer3))
        (not (atLocation agent1 sink1))
        (not (atLocation agent1 soap1))
        (not (atLocation agent1 soap2))
        (not (atLocation agent1 yellow_bottle))
        (not (atLocation agent1 brown_pump_bottle))
        (not (atLocation agent1 toilet_paper))

        ; Receptacles are openable
        (openable cabinet1)
        (openable drawer1)
        (openable drawer2)
        (openable drawer3)
        (openable sink1)

        ; Drawers are initially closed
        (not (opened drawer1))
        (not (opened drawer2))
        (not (opened drawer3))

        ; Soap bars are on the countertop (cabinet1)
        (inReceptacle soap1 cabinet1)
        (inReceptacle soap2 cabinet1)

        ; Other objects are also on the countertop
        (inReceptacle yellow_bottle cabinet1)
        (inReceptacle brown_pump_bottle cabinet1)
        (inReceptacle toilet_paper cabinet1)

        ; Agent holds nothing initially
        (not (holdsAny agent1))

        ; Soap is not clean
        (not (isClean soap1))
        (not (isClean soap2))
    )
    (:goal (and
        (inReceptacle soap1 drawer1)  ; Place rinsed soap1 in drawer1 (could also be drawer2 or drawer3)
        (isClean soap1)
    ))
)