(define (problem examine_credit_card_by_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        credit_card - object
        tall_lamp - object
        coffee_table - object
    )
    (:init
        (not (atLocation robot credit_card))
        (not (atLocation robot tall_lamp))
        (not (atLocation robot coffee_table))
        (not (holdsAny robot))
        (not (isOn tall_lamp))
        (not (isToggled tall_lamp))
        (not (holds robot credit_card))
        (atLocation credit_card coffee_table)
    )
    (:goal (and
        (isOn tall_lamp)
        (holds robot credit_card)
        (atLocation robot tall_lamp)
    ))
)