(define (problem place_bowl_in_cupboard)
    (:domain put_task)
    (:objects
        agent1 - agent
        cupboard - receptacle
        dishwasher - receptacle
        microwave - receptacle
        sink - receptacle
        knife - object
        fork - object
        mug - object
        toaster - object
        egg - object
        coffee_maker - object
        pot - object
        bowl - object  ; The bowl is not visible but is required by the instruction
    )
    (:init
        (openable cupboard)
        (openable dishwasher)
        (openable microwave)
        (openable sink)
        (not (opened cupboard))
        (not (opened dishwasher))
        (not (opened microwave))
        (not (opened sink))
        (not (holdsAny agent1))
        (not (isClean bowl))
        (not (isHot bowl))
        (not (isCool bowl))
        (not (isOn bowl))
        (not (isToggled bowl))
        (not (isSliced bowl))
        (atLocation agent1 cupboard)  ; Agent starts at the cupboard location as a reasonable default
        ; Assuming the bowl is initially on the countertop (since it's not visible, we place it somewhere plausible)
        (atLocation agent1 bowl)
    )
    (:goal (and (inReceptacle bowl cupboard)))
)