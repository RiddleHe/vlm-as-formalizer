(define (problem put_heated_tomato_on_table)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        sink1 - sink
        tomato1 - object
        knife1 - knife
        salt_shaker1 - object
        apple1 - object
        fork1 - object
        spatula1 - object
        lettuce1 - object
        book1 - object
        cup1 - object
        spoon1 - object
        soap_dispenser1 - object
        trash_can1 - object
        plate1 - object
        table1 - object
        counter1 - object
    )
    (:init
        ; Receptacles and their properties
        (openable microwave1)
        (not (opened microwave1))
        ; Objects' initial locations
        (atLocation agent1 counter1) ; Assuming agent starts at counter for efficiency, though not explicitly stated
        (inReceptacle plate1 microwave1)
        ; Tomato is on the counter
        (atLocation tomato1 counter1)
        ; Knife is on the table
        (atLocation knife1 table1)
        ; Other objects on counter
        (atLocation salt_shaker1 counter1)
        (atLocation apple1 counter1)
        (atLocation fork1 counter1)
        (atLocation spatula1 counter1)
        ; Objects on table
        (atLocation lettuce1 table1)
        (atLocation book1 table1)
        (atLocation cup1 table1)
        (atLocation spoon1 table1)
        (atLocation soap_dispenser1 table1)
        ; Trash can is next to counter (not a receptacle in domain)
        (atLocation trash_can1 counter1)
        ; Microwave is off
        (not (isOn microwave1))
        ; Tomato is not heated, not sliced, not cleaned, not cooled
        (not (isHot tomato1))
        (not (isSliced tomato1))
        (not (isClean tomato1))
        (not (isCool tomato1))
        ; Agent is not holding anything
        (not (holdsAny agent1))
    )
    (:goal (and
        (inReceptacle tomato1 table1)
        (isHot tomato1)
    ))
)