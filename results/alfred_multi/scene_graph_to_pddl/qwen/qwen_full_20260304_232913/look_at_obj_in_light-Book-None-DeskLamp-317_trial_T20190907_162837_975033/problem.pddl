(define (problem inspect_book_with_light)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_nightstand - receptacle
        bed - receptacle
        green_lamp - object
        blue_book - object
        gray_laptop - object
        white_pillow_1 - object
        white_pillow_2 - object
        yellow_pencil - object
        small_glass - object
        bed_frame - object
    )
    (:init
        (openable wooden_nightstand)
        (isOn green_lamp)
        (isToggled green_lamp)
        (inReceptacle yellow_pencil wooden_nightstand)
        (inReceptacle small_glass wooden_nightstand)
        (inReceptacle blue_book bed)
        (inReceptacle gray_laptop bed)
        (inReceptacle white_pillow_1 bed)
        (inReceptacle white_pillow_2 bed)
    )
    (:goal (and
        (atLocation robot blue_book)
        (atLocation robot green_lamp)
    ))
)