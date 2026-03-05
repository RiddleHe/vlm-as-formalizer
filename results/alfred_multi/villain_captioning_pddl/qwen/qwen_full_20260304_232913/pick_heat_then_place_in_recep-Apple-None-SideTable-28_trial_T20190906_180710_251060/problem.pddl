(define (problem put_warm_apple_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        table1 - receptacle  ; white table
        side_table1 - receptacle  ; black side table
        pan1 - receptacle
        pot1 - receptacle
        apple1 - object
        egg1 - object
        spoon1 - object
        salt_shaker1 - object
        bottle1 - object
        tray1 - object
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 table1))
        (not (atLocation agent1 side_table1))
        (not (atLocation agent1 pan1))
        (not (atLocation agent1 pot1))
        (not (atLocation agent1 apple1))
        (not (atLocation agent1 egg1))
        (not (atLocation agent1 spoon1))
        (not (atLocation agent1 salt_shaker1))
        (not (atLocation agent1 bottle1))
        (not (atLocation agent1 tray1))

        ; Receptacles properties
        (openable microwave1)
        (not (opened microwave1))
        (not (isOn microwave1))

        ; Objects locations
        (inReceptacle apple1 table1)
        (inReceptacle egg1 side_table1)
        (inReceptacle spoon1 side_table1)
        (inReceptacle salt_shaker1 table1)
        (inReceptacle bottle1 side_table1)
        (inReceptacle tray1 side_table1)

        ; Object states
        (not (isHot apple1))
        (not (holdsAny agent1))
    )
    (:goal (and
        (inReceptacle apple1 table1)
        (isHot apple1)
    ))
)