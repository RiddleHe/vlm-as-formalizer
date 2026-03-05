(define (problem put_bowl_in_cupboard)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        stove - receptacle
        countertop - receptacle
        dishwasher - receptacle
        cupboard_left_of_dishwasher - receptacle
        bowl - object
        mug - object
        fork - object
        toaster - object
        egg - object
        coffee_maker - object
    )
    (:init
        (openable dishwasher)
        (openable cupboard_left_of_dishwasher)
        (isOn stove)
        (isOn toaster)
        (inReceptacle bowl stove)
        (inReceptacle mug countertop)
        (inReceptacle knife countertop)
        (inReceptacle fork countertop)
        (inReceptacle toaster countertop)
        (inReceptacle egg countertop)
        (inReceptacle coffee_maker countertop)
    )
    (:goal (and (inReceptacle bowl cupboard_left_of_dishwasher)))
)