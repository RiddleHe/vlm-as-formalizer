(define (problem move_credit_cards)
    (:domain put_task)
    (:objects
        robot - agent
        beige_tv_stand_with_drawers - receptacle
        red_credit_card_1_on_tv_stand - object
        red_credit_card_2_on_tv_stand - object
        black_pencil_on_tv_stand - knife
        green_sofa_arm - object
        dark_tv_screen - object
        patterned_red_carpet - object
    )
    (:init
        (openable beige_tv_stand_with_drawers)
        (inReceptacle red_credit_card_1_on_tv_stand beige_tv_stand_with_drawers)
        (inReceptacle red_credit_card_2_on_tv_stand beige_tv_stand_with_drawers)
        (not (atLocation robot beige_tv_stand_with_drawers))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (not (inReceptacle red_credit_card_1_on_tv_stand beige_tv_stand_with_drawers))
            (not (inReceptacle red_credit_card_2_on_tv_stand beige_tv_stand_with_drawers))
        )
    )
)