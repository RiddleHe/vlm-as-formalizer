(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        trash_can - receptacle
        frying_pan - receptacle
        cup - receptacle
        cutting_board - object
        paper_towel - object
        tomato - object
        fork - object
        spoon - object
        cabbage - object
        bread - object
        potato - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle tomato trash_can)
        (inReceptacle fork cup)
        (inReceptacle spoon cup)
        (inReceptacle potato frying_pan)
        (atLocation agent microwave) ; Assuming agent starts near microwave for simplicity
    )
    (:goal
        (and
            (inReceptacle frying_pan fridge)
            (inReceptacle knife frying_pan)
            (isSliced potato)
            (isHot potato)
        )
    )
)