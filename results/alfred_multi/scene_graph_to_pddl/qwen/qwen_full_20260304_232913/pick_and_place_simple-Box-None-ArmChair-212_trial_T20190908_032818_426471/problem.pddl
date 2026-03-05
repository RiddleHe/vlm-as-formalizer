(define (problem put_box_on_chair)
    (:domain put_task)
    (:objects
        robot - agent
        open_brown_cardboard_box - receptacle
        green_chair - receptacle
    )
    (:init
        (openable open_brown_cardboard_box)
        (opened open_brown_cardboard_box)
        (atLocation robot open_brown_cardboard_box)
    )
    (:goal
        (inReceptacle open_brown_cardboard_box green_chair)
    )
)