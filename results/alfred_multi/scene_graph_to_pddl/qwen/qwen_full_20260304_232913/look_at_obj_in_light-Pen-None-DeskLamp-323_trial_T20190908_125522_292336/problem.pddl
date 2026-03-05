(define (problem get_pencil_and_look_under_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_nightstand_with_drawers - receptacle
        open_box_on_nightstand - receptacle
        yellow_pencil - object
        blue_card - object
        black_keychain - object
        white_lamp - object
    )
    (:init
        (openable wooden_nightstand_with_drawers)
        (openable open_box_on_nightstand)
        (opened open_box_on_nightstand)
        (isOn white_lamp)
        (isToggled white_lamp)
        (inReceptacle yellow_pencil wooden_nightstand_with_drawers)
        (inReceptacle blue_card open_box_on_nightstand)
        (inReceptacle black_keychain open_box_on_nightstand)
    )
    (:goal (and
        (holds robot yellow_pencil)
        (atLocation robot white_lamp)
    ))
)