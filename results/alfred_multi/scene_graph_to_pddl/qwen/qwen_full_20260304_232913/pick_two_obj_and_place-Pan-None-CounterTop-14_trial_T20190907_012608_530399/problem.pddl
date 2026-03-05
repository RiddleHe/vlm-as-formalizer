(define (problem place_pans_on_counter)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        pan1 - object
        pan2 - object
        bowl - object
        knife - object
        cup - object
        cabbage - object
        bread - object
        spoon1 - object
        spoon2 - object
        counter - receptacle
        stove - receptacle
    )
    (:init
        (openable microwave)
        (not (opened microwave))
        (isOn pan1)
        (isOn pan2)
        (isOn bowl)
        (not (holdsAny robot))
        (not (atLocation robot pan1))
        (not (atLocation robot pan2))
        (not (atLocation robot counter))
        (not (atLocation robot stove))
        (not (inReceptacle pan1 stove))
        (not (inReceptacle pan2 stove))
        (not (inReceptacle bowl stove))
        (not (inReceptacle knife counter))
        (not (inReceptacle cup counter))
        (not (inReceptacle cabbage counter))
        (not (inReceptacle bread counter))
        (not (inReceptacle spoon1 counter))
        (not (inReceptacle spoon2 counter))
    )
    (:goal
        (and
            (inReceptacle pan1 counter)
            (inReceptacle pan2 counter)
        )
    )
)