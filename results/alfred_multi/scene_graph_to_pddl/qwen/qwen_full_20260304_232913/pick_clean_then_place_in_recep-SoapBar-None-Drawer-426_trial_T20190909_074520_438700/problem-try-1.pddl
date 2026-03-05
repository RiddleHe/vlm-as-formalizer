(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        green_cabinet_drawers - receptacle
        brown_marble_sink - receptacle
        pink_bar_of_soap_left - object
        pink_bar_of_soap_right - object
        white_toilet_paper_roll - object
        brown_soap_dispenser - object
        yellow_knife - knife
    )
    (:init
        (openable green_cabinet_drawers)
        (inReceptacle pink_bar_of_soap_left green_cabinet_drawers)
        (inReceptacle pink_bar_of_soap_right green_cabinet_drawers)
        (inReceptacle white_toilet_paper_roll green_cabinet_drawers)
        (inReceptacle brown_soap_dispenser green_cabinet_drawers)
        (inReceptacle yellow_knife green_cabinet_drawers)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle pink_bar_of_soap_left green_cabinet_drawers)
        (isClean pink_bar_of_soap_left)
    ))
)