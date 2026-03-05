(define (problem carry_laptop_turn_on_light)
    (:domain put_task)
    (:objects
        robot - agent
        white_bed - receptacle
        beige_nightstand - receptacle
        gray_laptop_on_bed - object
        gray_laptop_on_bed_with_logo - object
        black_smartphone_on_bed - object
        book_on_bed - object
        white_pillow_on_bed - object
        beige_lamp_on_nightstand - object
        silver_alarm_clock_on_nightstand - object
    )
    (:init
        (openable beige_nightstand)
        (inReceptacle gray_laptop_on_bed white_bed)
        (inReceptacle gray_laptop_on_bed_with_logo white_bed)
        (inReceptacle black_smartphone_on_bed white_bed)
        (inReceptacle book_on_bed white_bed)
        (inReceptacle white_pillow_on_bed white_bed)
        (inReceptacle beige_lamp_on_nightstand beige_nightstand)
        (inReceptacle silver_alarm_clock_on_nightstand beige_nightstand)
        (not (holdsAny robot))
    )
    (:goal (and
        (holds robot gray_laptop_on_bed)
        (isOn beige_lamp_on_nightstand)
    ))
)