(define (problem place_remote_on_sofa)
    (:domain put_task)
    (:objects
        robot - agent
        black_coffee_table - receptacle
        black_sofa - receptacle
        open_cardboard_box - receptacle
        gray_dog_statue - object
        scattered_papers - object
        remote_control - object
        blue_cushion - object
    )
    (:init
        (openable open_cardboard_box)
        (opened open_cardboard_box)
        (inReceptacle scattered_papers open_cardboard_box)
        (inReceptacle gray_dog_statue black_coffee_table)
        (inReceptacle remote_control black_coffee_table)
        (inReceptacle blue_cushion black_sofa)
        (atLocation robot black_coffee_table)
    )
    (:goal (and
        (inReceptacle remote_control black_sofa)
    ))
)