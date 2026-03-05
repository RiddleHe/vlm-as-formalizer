(define (problem put_glass_and_knife_on_shelf)
    (:domain put_task)
    (:objects
        agent1 - agent
        black_microwave - microwave
        wooden_cabinet - receptacle
        silver_knife - knife
        loaf_of_bread - object
        purple_soap_dispenser - object
        egg - object
    )
    (:init
        (openable black_microwave)
        (openable wooden_cabinet)
        (opened black_microwave)
        (isOn black_microwave)
        (isToggled black_microwave)
        (inReceptacle silver_knife black_microwave)
        (inReceptacle loaf_of_bread black_microwave)
        (inReceptacle purple_soap_dispenser black_microwave)
        (inReceptacle egg black_microwave)
    )
    (:goal (and
        (inReceptacle silver_knife wooden_cabinet)
        (inReceptacle purple_soap_dispenser wooden_cabinet)
    ))
)