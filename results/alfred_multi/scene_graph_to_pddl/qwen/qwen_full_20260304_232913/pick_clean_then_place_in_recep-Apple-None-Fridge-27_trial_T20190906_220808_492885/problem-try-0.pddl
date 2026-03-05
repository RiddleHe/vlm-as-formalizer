(define (problem put_cleaned_apple_in_fridge)
    (:domain put_task)
    (:objects
        agent
        microwave
        fridge
        sink
        knife
        apple_on_table
        apple_in_microwave
        cup_in_sink
        bowl_in_sink
        egg_in_sink
    )
    (:init
        (openable microwave)
        (openable sink)
        (not (opened microwave))
        (not (opened sink))
        (not (holdsAny agent))
        (not (isClean apple_on_table))
        (not (isClean apple_in_microwave))
        (not (isClean cup_in_sink))
        (not (isClean bowl_in_sink))
        (not (isClean egg_in_sink))
        (not (isHot apple_in_microwave))
        (not (isCool apple_on_table))
        (not (isCool apple_in_microwave))
        (not (isOn microwave))
        (not (isToggled microwave))
        (not (isSliced apple_on_table))
        (not (isSliced apple_in_microwave))
        (inReceptacle apple_in_microwave microwave)
        (inReceptacle cup_in_sink sink)
        (inReceptacle bowl_in_sink sink)
        (inReceptacle egg_in_sink sink)
        (not (holds agent apple_on_table))
        (not (holds agent apple_in_microwave))
        (not (atLocation agent microwave))
        (not (atLocation agent sink))
        (not (atLocation agent apple_on_table))
        (not (atLocation agent apple_in_microwave))
        (not (atLocation agent cup_in_sink))
        (not (atLocation agent bowl_in_sink))
        (not (atLocation agent egg_in_sink))
    )
    (:goal (and
        (inReceptacle apple_on_table fridge)
        (isClean apple_on_table)
    ))
)