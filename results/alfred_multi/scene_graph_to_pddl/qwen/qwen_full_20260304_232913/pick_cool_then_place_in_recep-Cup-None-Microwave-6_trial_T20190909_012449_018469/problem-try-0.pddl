(define (problem place_cooled_cup_in_microwave)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        cup - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (isOn microwave)
        (isToggled microwave)
        (atLocation agent microwave)
    )
    (:goal (and
        (inReceptacle cup microwave)
        (isCool cup)
    ))
)