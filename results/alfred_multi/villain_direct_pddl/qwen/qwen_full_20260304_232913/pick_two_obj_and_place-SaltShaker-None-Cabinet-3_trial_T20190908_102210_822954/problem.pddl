(define (problem move_salt_shakers_to_cabinet)
    (:domain put_task)
    (:objects
        agent1 - agent
        salt_shaker1 salt_shaker2 - object
        cabinet_below_counter - receptacle
    )
    (:init
        (openable cabinet_below_counter)
        (not (opened cabinet_below_counter))
        (atLocation agent1 salt_shaker1)
        (atLocation agent1 salt_shaker2)
        (not (holdsAny agent1))
    )
    (:goal (and
        (inReceptacle salt_shaker1 cabinet_below_counter)
        (inReceptacle salt_shaker2 cabinet_below_counter)
    ))
)