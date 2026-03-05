(define (problem move_book_to_bed)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_desk - receptacle
        wooden_bed_frame - receptacle
        gray_trash_can - receptacle
        blue_book_on_desk - object
        gray_laptop_on_bed - object
        gray_laptop_on_desk - object
        blue_pen_on_desk - object
        white_lamp_on_desk - object
        silver_CD_on_desk - object
        black_chair - object
        gray_carpet - object
        white_brick_wall - object
        black_and_white_patterned_blanket_on_bed - object
        black_and_white_patterned_blanket_on_floor - object
        gray_trash_can_lid - object
        black_radiator_on_wall - object
    )
    (:init
        (openable gray_trash_can)
        (isOn gray_laptop_on_bed)
        (isOn gray_laptop_on_desk)
        (isOn white_lamp_on_desk)
        (isToggled gray_laptop_on_bed)
        (isToggled gray_laptop_on_desk)
        (isToggled white_lamp_on_desk)
        (inReceptacle gray_laptop_on_bed wooden_bed_frame)
        (inReceptacle gray_laptop_on_desk wooden_desk)
        (inReceptacle blue_book_on_desk wooden_desk)
        (inReceptacle blue_pen_on_desk wooden_desk)
        (inReceptacle white_lamp_on_desk wooden_desk)
        (inReceptacle silver_CD_on_desk wooden_desk)
        (atLocation robot wooden_desk)
    )
    (:goal (and
        (inReceptacle blue_book_on_desk wooden_bed_frame)
    ))
)