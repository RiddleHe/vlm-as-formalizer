(define (problem fill_pan_with_water_and_place_on_island)
    (:domain put_task)
    (:objects
        robot - agent
        pan - object
        sink - sink
        kitchen_island - receptacle
        knife - knife
        bowl1 - object
        bowl2 - object
        bottle1 - object
        bottle2 - object
        fork - object
        spoon - object
        apple - object
    )
    (:init
        (atLocation robot sink)
        (inReceptacle pan kitchen_island)
        (inReceptacle bowl1 kitchen_island)
        (inReceptacle bowl2 kitchen_island)
        (inReceptacle bottle1 kitchen_island)
        (inReceptacle bottle2 kitchen_island)
        (inReceptacle fork kitchen_island)
        (inReceptacle spoon kitchen_island)
        (inReceptacle apple kitchen_island)
        (openable kitchen_island)
        (opened kitchen_island)
        (openable sink)
        (opened sink)
        (not (isClean pan))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (isClean pan)
            (inReceptacle pan kitchen_island)
        )
    )
)