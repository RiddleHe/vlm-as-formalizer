(define (problem put_spray_bottle_on_toilet)
    (:domain put_task)
    (:objects
        agent1 - agent
        spray_bottle - object
        sink - receptacle
        toilet - receptacle
        paper_towel_roll - object
        yellow_cylinder - object
        white_cloth - object
        mirror - object
        countertop - object
        floor - object
    )
    (:init
        (atLocation agent1 countertop) ; Agent starts at the countertop, near the objects
        (inReceptacle spray_bottle countertop) ; Spray bottle is on the countertop
        (inReceptacle paper_towel_roll countertop)
        (inReceptacle yellow_cylinder countertop)
        (inReceptacle white_cloth countertop)
        (openable sink) ; Sink is openable (though not relevant for this task)
        (openable toilet) ; Toilet is openable (assumed for domain consistency)
        (not (opened toilet)) ; Toilet is initially closed
        (not (holdsAny agent1)) ; Agent is not holding anything
        (not (isClean spray_bottle))
        (not (isHot spray_bottle))
        (not (isCool spray_bottle))
        (not (isOn spray_bottle))
        (not (isToggled spray_bottle))
        (not (isSliced spray_bottle))
    )
    (:goal (and
        (inReceptacle spray_bottle toilet) ; Goal: spray bottle is on the toilet
    ))
)