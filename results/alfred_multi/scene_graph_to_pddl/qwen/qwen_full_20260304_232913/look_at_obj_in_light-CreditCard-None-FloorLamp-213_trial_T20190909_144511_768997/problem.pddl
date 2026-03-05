(define (problem examine_credit_card_by_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_table - receptacle
        red_credit_card - object
        black_ring_on_table_left - object
        black_ring_on_table_right - object
        tall_lamp_with_green_shade - object
    )
    (:init
        (atLocation robot wooden_table)
        (inReceptacle red_credit_card wooden_table)
        (inReceptacle black_ring_on_table_left wooden_table)
        (inReceptacle black_ring_on_table_right wooden_table)
        (not (holdsAny robot))
        (not (isOn tall_lamp_with_green_shade))
    )
    (:goal (and
        (atLocation robot tall_lamp_with_green_shade)
        (isOn tall_lamp_with_green_shade)
        (holds robot red_credit_card)
    ))
)