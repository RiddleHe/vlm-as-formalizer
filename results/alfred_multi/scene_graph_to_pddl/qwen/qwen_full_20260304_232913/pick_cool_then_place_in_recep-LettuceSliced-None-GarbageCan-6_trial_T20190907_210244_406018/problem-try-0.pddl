(define (problem put_cold_lettuce_in_trash)
    (:domain put_task)
    (:objects
        agent
        fridge - receptacle
        trash_can - receptacle
        lettuce_on_counter - object
        knife_on_counter - knife
        microwave - receptacle
        sink - receptacle
    )
    (:init
        (openable fridge)
        (not (opened fridge))
        (inReceptacle tomato_in_trash_can trash_can)
        (atLocation agent lettuce_on_counter)
        (not (holdsAny agent))
        (not (isCool lettuce_on_counter))
    )
    (:goal
        (and
            (inReceptacle lettuce_on_counter trash_can)
            (isCool lettuce_on_counter)
        )
    )
)