(define (problem wash_knife_and_return_to_shelf)
    (:domain put_task)
    (:objects
        agent1 - agent
        knife1 - knife
        sink1 - sink
        shelf1 - receptacle
        apple1 - object
        fork1 - object
        spoon1 - object
        saltshaker1 - object
        cup1 - object
        trashbag1 - object
    )
    (:init
        (atLocation agent1 shelf1)
        (inReceptacle knife1 shelf1)
        (inReceptacle apple1 shelf1)
        (inReceptacle fork1 shelf1)
        (inReceptacle spoon1 shelf1)
        (inReceptacle saltshaker1 shelf1)
        (inReceptacle cup1 shelf1)
        (inReceptacle trashbag1 shelf1)
        (openable sink1)
        (not (opened sink1))
        (not (isClean knife1))
    )
    (:goal
        (and
            (inReceptacle knife1 shelf1)
            (isClean knife1)
        )
    )
)