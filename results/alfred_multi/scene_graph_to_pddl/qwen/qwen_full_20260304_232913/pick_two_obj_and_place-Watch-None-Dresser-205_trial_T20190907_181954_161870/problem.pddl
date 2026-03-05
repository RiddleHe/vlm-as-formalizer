(define (problem put_watches_on_tv_stand)
    (:domain put_task)
    (:objects
        agent1 - agent
        tv_stand - receptacle
        dining_table - receptacle
        cardboard_box1 - receptacle
        cardboard_box2 - receptacle
        cardboard_box3 - receptacle
        remote_control1 - object
        remote_control2 - object
        remote_control3 - object
        red_card - object
        chair1 - object
        chair2 - object
        chair3 - object
        chair4 - object
    )
    (:init
        (openable cardboard_box1)
        (openable cardboard_box2)
        (openable cardboard_box3)
        (opened cardboard_box1)
        (opened cardboard_box2)
        (opened cardboard_box3)
        (inReceptacle remote_control1 dining_table)
        (inReceptacle remote_control2 dining_table)
        (inReceptacle remote_control3 dining_table)
        (inReceptacle red_card dining_table)
        (atLocation agent1 dining_table) ; assuming agent starts near table for accessibility
    )
    (:goal (and
        (inReceptacle remote_control1 tv_stand)
        (inReceptacle remote_control2 tv_stand)
    ))
)