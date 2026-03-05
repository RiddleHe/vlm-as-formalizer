(define (problem put_mug_with_spoon_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        mug1 - object
        spoon1 - object
        table1 - receptacle
        side_table1 - receptacle
        sink1 - sink
        microwave1 - microwave
        fridge1 - fridge
        knife1 - knife
    )
    (:init
        (atLocation agent1 side_table1)
        (inReceptacle mug1 side_table1)
        (inReceptacle spoon1 side_table1)
        (openable side_table1)
        (opened side_table1)
        (openable table1)
        (opened table1)
    )
    (:goal
        (and
            (inReceptacle mug1 table1)
            (inReceptacle spoon1 mug1)
        )
    )
)