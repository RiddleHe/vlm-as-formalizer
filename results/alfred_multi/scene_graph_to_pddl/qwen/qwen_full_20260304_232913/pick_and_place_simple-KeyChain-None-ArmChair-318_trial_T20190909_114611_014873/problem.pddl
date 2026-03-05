(define (problem move_keys_to_armchair)
    (:domain put_task)
    (:objects
        robot - agent
        floral_armchair - receptacle
        wooden_desk - receptacle
        purple_cushion - object
        keys - object
        lamp - object
    )
    (:init
        (openable floral_armchair)
        (openable wooden_desk)
        (isOn lamp)
        (isToggled lamp)
        (inReceptacle purple_cushion floral_armchair)
        (inReceptacle keys wooden_desk)
    )
    (:goal (and (inReceptacle keys floral_armchair)))
)