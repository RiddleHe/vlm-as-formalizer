(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        table1 - receptacle
        table2 - receptacle
        sink1 - sink
        knife1 - knife
        potato1 - object
        saltshaker1 - object
        bread1 - object
        lettuce1 - object
        egg1 - object
        apple1 - object
        cup1 - object
        vase1 - object
        trashbag1 - object
    )
    (:init
        (atLocation agent1 table1)
        (inReceptacle potato1 table1)
        (inReceptacle knife1 table2)
        (inReceptacle saltshaker1 table2)
        (inReceptacle bread1 table1)
        (inReceptacle lettuce1 table1)
        (inReceptacle egg1 table1)
        (inReceptacle apple1 table2)
        (inReceptacle cup1 table2)
        (inReceptacle vase1 table2)
        (inReceptacle trashbag1 table2)
        (openable microwave1)
        (not (opened microwave1))
        (not (isSliced potato1))
        (not (isHot potato1))
        (not (isClean potato1))
        (not (isCool potato1))
        (not (isOn microwave1))
        (not (holdsAny agent1))
        (not (holds agent1 ?o))
    )
    (:goal (and
        (inReceptacle potato1 table2)
        (isSliced potato1)
        (isHot potato1)
        (atLocation agent1 table2)
    ))
)