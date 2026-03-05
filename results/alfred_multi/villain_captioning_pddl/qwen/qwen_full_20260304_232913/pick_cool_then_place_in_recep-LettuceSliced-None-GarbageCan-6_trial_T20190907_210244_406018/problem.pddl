(define (problem put_cold_lettuce_in_garbage_can)
    (:domain put_task)
    (:objects
        robot - agent
        garbage_can - receptacle
        refrigerator - receptacle
        lettuce - object
        knife1 knife2 - knife
        tomato - object
    )
    (:init
        (openable garbage_can)
        (openable refrigerator)
        (inReceptacle tomato garbage_can)
        (atLocation robot lettuce)
        (not (isCool lettuce))
        (not (opened garbage_can))
        (not (opened refrigerator))
    )
    (:goal (and
        (inReceptacle lettuce garbage_can)
        (isCool lettuce)
    ))
)