(define (problem put_saltshaker_in_drawer)
    (:domain put_task)
    (:objects
        agent - agent
        saltshaker - object
        drawer1 - receptacle
        egg - object
    )
    (:init
        (openable drawer1)
        (not (opened drawer1))
        (atLocation agent egg)  ; agent starts near egg (as a proxy for countertop)
        ; saltshaker is on countertop — we'll model it as being at egg's location initially
        (atLocation saltshaker egg)
    )
    (:goal (and (inReceptacle saltshaker drawer1)))
)