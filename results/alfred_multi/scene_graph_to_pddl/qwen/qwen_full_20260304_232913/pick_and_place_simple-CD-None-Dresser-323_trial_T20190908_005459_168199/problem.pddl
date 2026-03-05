(define (problem move_cd_to_dresser)
    (:domain put_task)
    (:objects
        robot - agent
        brown_microwave_on_desk - microwave
        wooden_dresser_with_drawers - receptacle
        cd_on_desk - object
        cd_on_desk_2 - object
        black_mug - object
        black_mug_2 - object
        blue_object_on_desk - object
        black_bowl_on_desk - object
        smartphone_on_desk - object
        lamp_on_desk - object
        books_on_desk - object
        wooden_chair - object
    )
    (:init
        (openable brown_microwave_on_desk)
        (openable wooden_dresser_with_drawers)
        (opened brown_microwave_on_desk)
        (opened wooden_dresser_with_drawers)
        (isOn brown_microwave_on_desk)
        (isOn lamp_on_desk)
        (isToggled brown_microwave_on_desk)
        (isToggled lamp_on_desk)
        (atLocation robot wooden_dresser_with_drawers) ; assuming robot starts near dresser for simplicity, as no initial location is specified
    )
    (:goal
        (and
            (inReceptacle cd_on_desk wooden_dresser_with_drawers)
        )
    )
)