(define (problem move_watch_to_table)
    (:domain put_task)
    (:objects
        robot - agent
        small_wooden_table - receptacle
        tv_stand - receptacle
        watch_on_tv_stand - object
        watch_on_floor - object
        newspaper_on_small_wooden_table - object
        statue_on_tv_stand - object
        remote_control_on_tv_stand - object
        credit_card_on_tv_stand - object
    )
    (:init
        (atLocation robot tv_stand)
        (inReceptacle newspaper_on_small_wooden_table small_wooden_table)
    )
    (:goal (and (inReceptacle watch_on_tv_stand small_wooden_table)))
)