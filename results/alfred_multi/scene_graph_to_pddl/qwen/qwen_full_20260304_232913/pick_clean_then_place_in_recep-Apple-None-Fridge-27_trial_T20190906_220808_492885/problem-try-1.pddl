(define (problem put_cleaned_apple_in_fridge)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        apple_on_table - object
        apple_in_microwave - object
        apple_in_sink - object
        cup_in_sink - object
        bowl_in_sink - object
        countertop - object
        table - object
    )
    (:init
        (openable microwave)
        (openable fridge)
        (openable sink)
        (opened microwave)
        (opened fridge)
        (opened sink)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle apple_in_microwave microwave)
        (inReceptacle apple_in_sink sink)
        (inReceptacle cup_in_sink sink)
        (inReceptacle bowl_in_sink sink)
        (atLocation agent table) ; assuming agent starts near table as it's a common starting point
    )
    (:goal (and
        (inReceptacle apple_in_sink fridge)
        (isClean apple_in_sink)
    ))
)