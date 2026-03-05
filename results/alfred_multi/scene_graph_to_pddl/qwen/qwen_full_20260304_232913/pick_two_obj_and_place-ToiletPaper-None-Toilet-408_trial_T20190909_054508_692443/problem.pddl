(define (problem put_toilet_paper_on_toilet)
    (:domain put_task)
    (:objects
        robot - agent
        gray_toilet - receptacle
        gray_trash_can - receptacle
        white_toilet_paper_roll - object
        white_toilet_paper_roll_in_trash_can - object
    )
    (:init
        (openable gray_trash_can)
        (inReceptacle white_toilet_paper_roll_in_trash_can gray_trash_can)
        (not (atLocation robot gray_toilet))
        (not (atLocation robot gray_trash_can))
        (not (atLocation robot white_toilet_paper_roll))
        (not (atLocation robot white_toilet_paper_roll_in_trash_can))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle white_toilet_paper_roll gray_toilet)
            (inReceptacle white_toilet_paper_roll_in_trash_can gray_toilet)
        )
    )
)