(define (problem slice_lettuce)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        table1 - receptacle
        knife_with_yellow_handle - knife
        tomato1 - object
        apple1 - object
        salt_shaker1 - object
        lettuce1 - object
        mug1 - object
        wine_glass1 - object
        spatula1 - object
    )
    (:init
        (openable microwave1)
        (isOn microwave1)
        (isToggled microwave1)
        (inReceptacle mug1 microwave1)
        (inReceptacle tomato1 table1)
        (inReceptacle apple1 table1)
        (inReceptacle salt_shaker1 table1)
        (inReceptacle lettuce1 table1)
        (inReceptacle knife_with_yellow_handle table1)
        (inReceptacle spatula1 table1)
        (inReceptacle wine_glass1 table1)
    )
    (:goal (isSliced lettuce1))
)