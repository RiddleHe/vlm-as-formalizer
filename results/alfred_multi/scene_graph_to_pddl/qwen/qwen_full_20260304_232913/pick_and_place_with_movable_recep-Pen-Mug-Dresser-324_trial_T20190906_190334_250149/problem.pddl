(define (problem put_pen_in_cup)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_dresser_with_drawers - receptacle
        black_cup_on_dresser - receptacle
        gray_laptop_on_dresser - object
        yellow_pen_on_dresser - object
        red_pencil_on_dresser - object
        brown_radio_on_dresser - object
        blue_phone_on_dresser - object
        keys_on_dresser - object
    )
    (:init
        (openable wooden_dresser_with_drawers)
        (isOn gray_laptop_on_dresser)
        (isOn brown_radio_on_dresser)
        (isToggled brown_radio_on_dresser)
        (inReceptacle black_cup_on_dresser wooden_dresser_with_drawers)
        (inReceptacle gray_laptop_on_dresser wooden_dresser_with_drawers)
        (inReceptacle yellow_pen_on_dresser wooden_dresser_with_drawers)
        (inReceptacle red_pencil_on_dresser wooden_dresser_with_drawers)
        (inReceptacle brown_radio_on_dresser wooden_dresser_with_drawers)
        (inReceptacle blue_phone_on_dresser wooden_dresser_with_drawers)
        (inReceptacle keys_on_dresser wooden_dresser_with_drawers)
    )
    (:goal (and
        (inReceptacle yellow_pen_on_dresser black_cup_on_dresser)
    ))
)