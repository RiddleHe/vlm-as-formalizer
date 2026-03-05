(define (problem put_heated_tomato_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        microwave fridge sink - receptacle
        knife_on_table knife_on_counter - knife
        red_tomato yellow_apple fork_on_counter spatula_on_counter green_lettuce green_book salt_shaker pepper_shaker cup_on_table - object
        golden_cup plate_on_counter plate_on_table - receptacle
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (opened microwave)
        (inReceptacle red_tomato microwave)
        (inReceptacle plate_on_counter golden_cup)
        (atLocation robot microwave)
    )
    (:goal (and
        (inReceptacle red_tomato plate_on_table)
        (isHot red_tomato)
    ))
)