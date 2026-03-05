(define (problem move_keys)
    (:domain put_task)
    (:objects
        agent1 - agent
        dresser - receptacle
        white_table - receptacle
        keys1 keys2 - object
    )
    (:init
        (atLocation agent1 dresser)
        (inReceptacle keys1 dresser)
        (inReceptacle keys2 dresser)
        (openable dresser)
        (opened dresser)
    )
    (:goal (and
        (inReceptacle keys1 white_table)
        (inReceptacle keys2 white_table)
    ))
)