(define (problem put_washed_sliced_lettuce)
    (:domain put_task)
    (:objects
        agent1 - agent
        lettuce - object
        knife1 knife2 - knife
        sink1 - sink
        countertop1 - object
        fridge1 - fridge
        cabinet1 - receptacle
        table1 - object
        egg1 potato1 - object
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation agent1 sink1))
        (not (atLocation agent1 table1))
        (not (atLocation agent1 countertop1))
        (not (atLocation agent1 fridge1))
        (not (atLocation agent1 cabinet1))
        (not (atLocation agent1 knife1))
        (not (atLocation agent1 knife2))
        (not (atLocation agent1 lettuce))
        (not (atLocation agent1 egg1))
        (not (atLocation agent1 potato1))

        ; Objects are at their initial locations
        (atLocation agent1 table1) ; Assuming agent starts near table for simplicity, or can be changed
        (atLocation lettuce table1)
        (atLocation knife1 countertop1)
        (atLocation knife2 table1)
        (atLocation egg1 sink1)
        (atLocation potato1 sink1)

        ; Receptacles are not opened
        (openable fridge1)
        (openable cabinet1)
        (not (opened fridge1))
        (not (opened cabinet1))

        ; Lettuce is not sliced or cleaned
        (not (isSliced lettuce))
        (not (isClean lettuce))

        ; Agent is not holding anything
        (not (holdsAny agent1))
    )
    (:goal
        (and
            (inReceptacle lettuce countertop1) ; Placed on countertop beside sink
            (isClean lettuce)
            (isSliced lettuce)
        )
    )
)