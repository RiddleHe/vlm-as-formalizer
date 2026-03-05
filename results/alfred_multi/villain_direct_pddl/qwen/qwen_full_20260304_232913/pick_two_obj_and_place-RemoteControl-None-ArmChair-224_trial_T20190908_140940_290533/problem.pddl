(define (problem move_remotes_to_chair)
    (:domain put_task)
    (:objects
        agent1 - agent
        remote1 remote2 - object
        chair1 - receptacle
        sofa1 - receptacle
    )
    (:init
        (atLocation agent1 sofa1)
        (inReceptacle remote1 sofa1)
        (inReceptacle remote2 sofa1)
        (openable chair1)
        (openable sofa1)
    )
    (:goal
        (and
            (inReceptacle remote1 chair1)
            (inReceptacle remote2 chair1)
        )
    )
)