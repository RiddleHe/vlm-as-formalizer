(define (problem put_two_candles_on_shelf)
    (:domain put_task)
    (:objects
        robot - agent
        beige_toilet - receptacle
        beige_cabinet - receptacle
        black_hexagonal_trash_can - receptacle
        white_toilet_paper_roll - object
        two_brown_candles - object
        green_toilet_brush - object
    )
    (:init
        (openable beige_cabinet)
        (not (opened beige_cabinet))
        (inReceptacle white_toilet_paper_roll beige_toilet)
        (inReceptacle green_toilet_brush beige_toilet)
        (not (holdsAny robot))
        (not (atLocation robot beige_toilet))
        (not (atLocation robot beige_cabinet))
        (not (atLocation robot black_hexagonal_trash_can))
        (not (atLocation robot white_toilet_paper_roll))
        (not (atLocation robot two_brown_candles))
        (not (atLocation robot green_toilet_brush))
    )
    (:goal
        (and
            (inReceptacle two_brown_candles beige_cabinet)
        )
    )
)