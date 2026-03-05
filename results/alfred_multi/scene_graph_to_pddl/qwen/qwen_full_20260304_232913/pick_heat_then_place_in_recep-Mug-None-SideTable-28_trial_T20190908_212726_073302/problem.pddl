(define (problem place_microwaved_mug_on_shelves)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        pan - object
        toaster - object
        coffee_machine - object
        bread - object
        apple - object
        egg - object
        spoon - object
        shelf - receptacle
        countertop - object
    )
    (:init
        (openable microwave)
        (opened microwave)
        (isOn coffee_machine)
        (isOn toaster)
        (isToggled coffee_machine)
        (isToggled toaster)
        (inReceptacle pan microwave)
        (inReceptacle apple shelf)
        (inReceptacle egg shelf)
        (inReceptacle spoon shelf)
        (atLocation robot shelf)
    )
    (:goal (and
        (inReceptacle pan shelf)
    ))
)