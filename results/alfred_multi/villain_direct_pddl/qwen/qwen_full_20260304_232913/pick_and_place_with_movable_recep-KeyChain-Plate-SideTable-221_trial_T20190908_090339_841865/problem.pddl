(define (problem put_plate_with_keys_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        plate1 - object
        keys1 - object
        table1 - receptacle
        table2 - receptacle
    )
    (:init
        (atLocation agent1 table1)
        (inReceptacle plate1 table1)
        (inReceptacle keys1 table1)
        (openable table1)
        (opened table1)
        (openable table2)
        (opened table2)
    )
    (:goal
        (and
            (inReceptacle plate1 table2)
            (inReceptacle keys1 plate1)
        )
    )
)