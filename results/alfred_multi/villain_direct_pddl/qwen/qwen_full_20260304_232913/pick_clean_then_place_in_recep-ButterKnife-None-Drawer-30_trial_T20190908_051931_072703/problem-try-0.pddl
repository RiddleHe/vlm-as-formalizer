(define (problem put_clean_knife_in_cabinet_drawer)
    (:domain put_task)
    (:objects
        agent1 - agent
        knife1 - knife
        sink1 - sink
        cabinet_drawer1 - receptacle
        bread1 - object
        apple1 - object
        pear1 - object
        bowl1 - receptacle
        spoon1 - object
        phone1 - object
        potted_plant1 - object
        tomato1 - object
        tray1 - receptacle
        fork1 - object
    )
    (:init
        (atLocation agent1 sink1)  ; Assume agent starts near sink for cleaning
        (atLocation knife1 sink1) ; Knife is initially in the sink
        (openable cabinet_drawer1)
        (isClean knife1) ; Knife is already clean (as per instruction to put "clean knife")
        (not (holdsAny agent1))
        (not (opened cabinet_drawer1))
        ; Other objects are present but not relevant to the goal
        (atLocation bread1 bowl1)
        (atLocation apple1 cabinet_drawer1)
        (atLocation pear1 cabinet_drawer1)
        (atLocation phone1 cabinet_drawer1)
        (atLocation potted_plant1 cabinet_drawer1)
        (atLocation tomato1 cabinet_drawer1)
        (atLocation fork1 sink1)
        (atLocation spoon1 sink1)
        (atLocation tray1 cabinet_drawer1)
    )
    (:goal
        (and
            (inReceptacle knife1 cabinet_drawer1)
            (opened cabinet_drawer1) ; Must be opened to put knife in
        )
    )
)