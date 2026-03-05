(define (problem put_bowl_in_cupboard)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife_on_counter
        stove
        counter
        dishwasher
        cupboard_left_of_dishwasher
        bowl
        mug
        fork
        toaster
        egg
        coffee_maker
    )
    (:init
        (openable dishwasher)
        (openable cupboard_left_of_dishwasher)
        (isOn stove)
        (isOn toaster)
        (isOn coffee_maker)
        (inReceptacle bowl stove)
        (inReceptacle mug counter)
        (inReceptacle knife_on_counter counter)
        (inReceptacle fork counter)
        (inReceptacle egg counter)
        (inReceptacle toaster counter)
        (inReceptacle coffee_maker counter)
    )
    (:goal (inReceptacle bowl cupboard_left_of_dishwasher))
)