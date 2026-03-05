(define (problem move_salt_shakers_to_cabinet)
    (:domain put_task)
    (:objects
        agent1 - agent
        saltShaker1 saltShaker2 pepperShaker - object
        cabinetBelowCounter - receptacle
        pot - object
        sink - receptacle
        fridge - receptacle
    )
    (:init
        (openable cabinetBelowCounter)
        (opened cabinetBelowCounter)
        (inReceptacle pot cabinetBelowCounter)
        (atLocation agent1 sink) ; Initial location can be arbitrary; chosen as sink for example
        (not (holdsAny agent1))
        (not (isClean saltShaker1))
        (not (isClean saltShaker2))
        (not (isHot saltShaker1))
        (not (isHot saltShaker2))
        (not (isCool saltShaker1))
        (not (isCool saltShaker2))
        (not (isSliced saltShaker1))
        (not (isSliced saltShaker2))
        (not (isToggled saltShaker1))
        (not (isToggled saltShaker2))
        (not (inReceptacle saltShaker1 cabinetBelowCounter))
        (not (inReceptacle saltShaker2 cabinetBelowCounter))
        (not (inReceptacle saltShaker1 sink))
        (not (inReceptacle saltShaker2 sink))
        (not (inReceptacle saltShaker1 fridge))
        (not (inReceptacle saltShaker2 fridge))
        (not (holds agent1 saltShaker1))
        (not (holds agent1 saltShaker2))
    )
    (:goal (and
        (inReceptacle saltShaker1 cabinetBelowCounter)
        (inReceptacle saltShaker2 cabinetBelowCounter)
    ))
)