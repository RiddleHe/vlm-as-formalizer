(define (problem move_keys)
    (:domain put_task)
    (:objects
        robot - agent
        white_table - receptacle
        wooden_dresser - receptacle
        blue_keys - object
        other_keys - object
    )
    (:init
        (openable wooden_dresser)
        (openable white_table)
        (inReceptacle blue_keys wooden_dresser)
        (inReceptacle other_keys wooden_dresser)
    )
    (:goal (and
        (inReceptacle blue_keys white_table)
        (inReceptacle other_keys white_table)
    ))
)