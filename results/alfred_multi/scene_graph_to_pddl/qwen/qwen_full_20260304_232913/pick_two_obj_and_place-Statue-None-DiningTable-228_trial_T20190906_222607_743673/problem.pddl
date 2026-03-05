(define (problem set_statues_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        agent2 - agent
        black_statue1 - object
        black_statue2 - object
        wooden_coffee_table - receptacle
        red_sofa - receptacle
        open_cardboard_box - receptacle
        black_side_table - receptacle
        silver_laptop - object
        remote_control - object
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
    )
    (:init
        (atLocation agent1 black_statue1)
        (atLocation agent2 black_statue2)
        (inReceptacle silver_laptop red_sofa)
        (inReceptacle open_cardboard_box red_sofa)
        (isOn silver_laptop)
        (isToggled silver_laptop)
        (openable open_cardboard_box)
        (opened open_cardboard_box)
    )
    (:goal
        (and
            (inReceptacle black_statue1 wooden_coffee_table)
            (inReceptacle black_statue2 wooden_coffee_table)
        )
    )
)