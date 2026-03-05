(define (problem put_cleaned_apple_in_fridge)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        fridge - fridge
        sink - sink
        knife - knife
        apple - object
        cup - object
        bowl - object
        egg - object
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
        (inReceptacle apple microwave)
        (inReceptacle cup sink)
        (inReceptacle bowl sink)
        (inReceptacle egg sink)
        (atLocation robot microwave) ; assuming robot starts near microwave as per image 1
    )
    (:goal (and
        (inReceptacle apple fridge)
        (isClean apple)
    ))
)