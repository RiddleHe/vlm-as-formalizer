(define (problem move_phone_to_shelf)
    (:domain put_task)
    (:objects
        agent - agent
        dark_wood_end_table - receptacle
        bookshelf - receptacle
        red_and_gray_cd_player - object
        silver_cd_on_end_table - object
        silver_cd_on_end_table_2 - object
        books_in_bookshelf - object
    )
    (:init
        (openable dark_wood_end_table)
        (openable bookshelf)
        (isOn red_and_gray_cd_player)
        (isToggled red_and_gray_cd_player)
        (inReceptacle books_in_bookshelf bookshelf)
        (atLocation agent dark_wood_end_table) ; assuming agent starts near end table for practicality
    )
    (:goal (and
        (inReceptacle red_and_gray_cd_player bookshelf)
    ))
)