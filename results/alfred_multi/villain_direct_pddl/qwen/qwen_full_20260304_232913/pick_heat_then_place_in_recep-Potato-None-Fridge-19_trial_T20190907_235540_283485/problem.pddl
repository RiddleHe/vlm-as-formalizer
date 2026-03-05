(define (problem put_heated_potato_in_fridge)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        fridge1 - fridge
        potato1 - object
        table1 - object
        chair1 - object
        coffee_machine1 - object
        apple1 - object
        apple2 - object
        apple3 - object
        bread1 - object
        plate1 - object
        notebook1 - object
        notebook2 - object
        bottle1 - object
        knife1 - knife
        fork1 - object
        sink1 - sink
    )
    (:init
        (atLocation agent1 table1)
        (inReceptacle potato1 table1)
        (inReceptacle apple1 table1)
        (inReceptacle apple2 table1)
        (inReceptacle apple3 table1)
        (inReceptacle bread1 table1)
        (inReceptacle plate1 table1)
        (inReceptacle notebook1 table1)
        (inReceptacle notebook2 table1)
        (inReceptacle bottle1 table1)
        (inReceptacle knife1 table1)
        (inReceptacle fork1 sink1)
        (openable fridge1)
        (not (opened fridge1))
        (isOn microwave1)
        (isToggled microwave1)
    )
    (:goal
        (and
            (inReceptacle potato1 fridge1)
            (isHot potato1)
            (isCool potato1)
        )
    )
)