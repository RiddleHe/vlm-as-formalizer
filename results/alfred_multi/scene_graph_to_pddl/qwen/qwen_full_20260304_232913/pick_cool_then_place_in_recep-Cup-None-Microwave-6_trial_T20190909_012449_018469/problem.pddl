(define (problem place_cooled_cup_in_microwave)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        countertop - receptacle
        cup - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (isOn microwave)
        (isToggled microwave)
        (atLocation robot countertop)
    )
    (:goal (and
        (inReceptacle cup microwave)
        (isCool cup)
    ))
)