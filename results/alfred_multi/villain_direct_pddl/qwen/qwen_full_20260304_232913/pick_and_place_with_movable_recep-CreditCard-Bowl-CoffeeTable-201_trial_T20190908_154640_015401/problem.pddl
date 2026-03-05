(define (problem put_bowl_with_credit_card_on_glass_table)
    (:domain put_task)
    (:objects
        robot - agent
        bowl - object
        credit_card - object
        glass_table - receptacle
        dining_table - receptacle
        chair - object
        statue - object
        remote - object
        vase - object
        book - object
        tissue_box - object
        plate - object
        cup - object
    )
    (:init
        (atLocation robot dining_table)
        (inReceptacle bowl dining_table)
        (inReceptacle credit_card dining_table)
        (openable glass_table)
        (not (opened glass_table))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle bowl glass_table)
            (inReceptacle credit_card bowl)
        )
    )
)