(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent
        wooden_desk
        wooden_dresser
        metal_bowl_on_dresser_1
        metal_bowl_on_dresser_2
        pen_on_dresser
        cd_on_dresser
        cd_on_desk
        laptop_on_desk
        black_office_chair
        brown_boots
        basketball
        lamp_on_dresser
        alarm_clock_on_dresser
        microwave
        fridge
        sink
        knife
    )
    (:init
        (openable wooden_dresser)
        (openable wooden_desk)
        (isOn lamp_on_dresser)
        (isOn laptop_on_desk)
        (isToggled lamp_on_dresser)
        (isToggled laptop_on_desk)
        (inReceptacle cd_on_dresser metal_bowl_on_dresser_1)
        (inReceptacle cd_on_dresser metal_bowl_on_dresser_2)
        (atLocation agent wooden_dresser) ; Assuming agent starts near dresser where pen is
    )
    (:goal
        (and
            (inReceptacle pen_on_dresser metal_bowl_on_dresser_1)
            (atLocation agent wooden_desk)
        )
    )
)