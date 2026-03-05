(define (problem put_cup_on_desk)
    (:domain put_task)
    (:objects
        robot - agent
        black_desk - receptacle
        black_bookshelf - receptacle
        black_drawer_unit - receptacle
        silver_cup - object
        pen_on_desk - object
        pen_on_bookshelf - object
        book_on_desk - object
        cd_on_desk - object
        smartphone_on_desk - object
        lamp_on_desk - object
        tissue_box_on_desk - object
        potted_plant_on_bookshelf - object
        alarm_clock_on_bookshelf - object
        cardboard_box_on_bookshelf - object
    )
    (:init
        (openable black_drawer_unit)
        (inReceptacle silver_cup black_bookshelf)
        (inReceptacle pen_on_bookshelf black_bookshelf)
        (inReceptacle potted_plant_on_bookshelf black_bookshelf)
        (inReceptacle alarm_clock_on_bookshelf black_bookshelf)
        (inReceptacle cardboard_box_on_bookshelf black_bookshelf)
        (inReceptacle book_on_desk black_desk)
        (inReceptacle cd_on_desk black_desk)
        (inReceptacle smartphone_on_desk black_desk)
        (inReceptacle lamp_on_desk black_desk)
        (inReceptacle tissue_box_on_desk black_desk)
        (inReceptacle pen_on_desk black_desk)
        (not (atLocation robot black_desk))
        (not (atLocation robot black_bookshelf))
        (not (atLocation robot black_drawer_unit))
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle silver_cup black_desk)
    ))
)