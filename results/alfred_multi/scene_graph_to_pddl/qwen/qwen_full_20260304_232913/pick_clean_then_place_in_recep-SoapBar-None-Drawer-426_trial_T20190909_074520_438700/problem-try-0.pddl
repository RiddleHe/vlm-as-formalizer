(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        green_cabinet_drawer - receptacle
        brown_marble_sink - receptacle
        pink_bar_of_soap - object
        yellow_knife - knife
        toilet_paper_roll - object
        soap_dispenser - object
    )
    (:init
        (openable green_cabinet_drawer)
        (inReceptacle pink_bar_of_soap green_cabinet_drawer)
        (inReceptacle yellow_knife green_cabinet_drawer)
        (inReceptacle toilet_paper_roll green_cabinet_drawer)
        (inReceptacle soap_dispenser green_cabinet_drawer)
    )
    (:goal (and
        (inReceptacle pink_bar_of_soap green_cabinet_drawer)
        (isClean pink_bar_of_soap)
    ))
)