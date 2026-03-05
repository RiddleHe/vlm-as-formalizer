(define (problem place_rinsed_soap_in_drawer)
    (:domain put_task)
    (:objects
        agent1 - agent
        brown_marble_sink - sink
        green_cabinet_drawer - receptacle
        green_cabinet_drawer_2 - receptacle
        green_cabinet_drawer_3 - receptacle
        green_cabinet_drawer_4 - receptacle
        green_cabinet_drawer_5 - receptacle
        green_cabinet_drawer_6 - receptacle
        pink_bar_of_soap_1 - object
        pink_bar_of_soap_2 - object
        yellow_knife - knife
        toilet_paper_roll - object
        brown_soap_dispenser - object
    )
    (:init
        (openable green_cabinet_drawer)
        (openable green_cabinet_drawer_2)
        (openable green_cabinet_drawer_3)
        (openable green_cabinet_drawer_4)
        (openable green_cabinet_drawer_5)
        (openable green_cabinet_drawer_6)
        (inReceptacle pink_bar_of_soap_1 green_cabinet_drawer)
        (inReceptacle pink_bar_of_soap_2 green_cabinet_drawer_2)
        (not (holdsAny agent1))
    )
    (:goal
        (and
            (inReceptacle pink_bar_of_soap_1 green_cabinet_drawer)
            (isClean pink_bar_of_soap_1)
        )
    )
)