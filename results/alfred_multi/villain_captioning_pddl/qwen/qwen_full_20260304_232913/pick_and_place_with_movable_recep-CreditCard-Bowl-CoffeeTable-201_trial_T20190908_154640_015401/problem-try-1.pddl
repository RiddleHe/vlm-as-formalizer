(define (problem put_bowl_with_credit_card_on_glass_table)
    (:domain put_task)
    (:objects
        robot - agent
        dining_table - receptacle
        glass_coffee_table - receptacle
        bowl - object
        credit_card - object
        statue - object
        remote - object
        vase - object
        chair1 - object
        chair2 - object
        tissue_box - object
        coaster1 - object
        coaster2 - object
        small_dish - object
        plate - object
    )
    (:init
        (atLocation robot dining_table) ; Assume robot starts near dining table for simplicity, or can be adjusted
        (inReceptacle bowl dining_table)
        (inReceptacle credit_card glass_coffee_table)
        (inReceptacle statue dining_table)
        (inReceptacle remote dining_table)
        (inReceptacle vase dining_table)
        (inReceptacle tissue_box glass_coffee_table)
        (inReceptacle coaster1 glass_coffee_table)
        (inReceptacle coaster2 glass_coffee_table)
        (inReceptacle small_dish glass_coffee_table)
        (inReceptacle plate glass_coffee_table)
        (not (holdsAny robot))
        (not (isClean bowl))
        (not (isHot bowl))
        (not (isCool bowl))
        (not (isOn bowl))
        (not (isToggled bowl))
        (not (isSliced bowl))
        (not (isClean credit_card))
        (not (isHot credit_card))
        (not (isCool credit_card))
        (not (isOn credit_card))
        (not (isToggled credit_card))
        (not (isSliced credit_card))
    )
    (:goal (and
        (inReceptacle bowl glass_coffee_table)
        (inReceptacle credit_card bowl)
    ))
)