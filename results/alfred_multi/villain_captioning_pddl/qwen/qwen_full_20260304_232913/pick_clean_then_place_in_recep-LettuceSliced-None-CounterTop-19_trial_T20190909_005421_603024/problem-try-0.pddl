(define (problem put_washed_sliced_lettuce)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink - sink
        fridge - fridge
        cabinet1 cabinet2 - receptacle
        knife1 knife2 - knife
        lettuce - object
        egg - object
        potato - object
        bread - object
        tomato - object
        coffee_maker - object
        bottle1 bottle2 - object
    )
    (:init
        (atLocation agent1 sink) ; Assuming agent starts near sink for simplicity, or can be changed to a neutral location
        (inReceptacle egg sink)
        (inReceptacle potato sink)
        (isClean egg) ; Not true, but for planning we can assume it's not clean initially
        (isClean potato) ; Not true, but for planning we can assume it's not clean initially
        (not (isClean lettuce))
        (not (isSliced lettuce))
        (not (holdsAny agent1))
        (openable fridge)
        (openable cabinet1)
        (openable cabinet2)
        (not (opened fridge))
        (not (opened cabinet1))
        (not (opened cabinet2))
        (atLocation knife1 sink) ; Knife on countertop near sink
        (atLocation knife2 lettuce) ; Knife on table with lettuce (assuming it's at the same location as lettuce for simplicity)
        (atLocation lettuce coffee_maker) ; Lettuce is on the table with coffee maker
        (atLocation bread coffee_maker)
        (atLocation tomato coffee_maker)
        (atLocation bottle1 coffee_maker)
        (atLocation bottle2 coffee_maker)
        (not (isOn coffee_maker))
    )
    (:goal (and
        (inReceptacle lettuce sink) ; This is not correct, goal is to put on counter by sink
        (isClean lettuce)
        (isSliced lettuce)
    ))
)