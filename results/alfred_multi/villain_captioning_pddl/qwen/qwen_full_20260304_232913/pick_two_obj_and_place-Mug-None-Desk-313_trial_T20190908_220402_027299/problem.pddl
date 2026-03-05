(define (problem place_cup_on_desk)
    (:domain put_task)
    (:objects
        robot - agent
        mug - object
        desk - receptacle
        bookshelf - receptacle
        book_clean_code - object
        cd - object
        smartphone1 - object
        smartphone2 - object
        tissue_box - object
        lamp - object
        pen - object
        cardboard_box - object
        alarm_clock - object
        potted_plant - object
        stapler - object
        office_chair - object
    )
    (:init
        (atLocation robot bookshelf)
        (inReceptacle mug bookshelf)
        (openable bookshelf)
        (opened bookshelf)
        (openable desk)
        (opened desk)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle mug desk)
    ))
)