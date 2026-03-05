(define (problem put_two_spray_bottles_on_metal_rack)
    (:domain put_task)
    (:objects
        robot - agent
        yellow_spray_bottle - object
        silver_spray_bottle - object
        metal_rack - receptacle
        blue_bin - receptacle
    )
    (:init
        (openable metal_rack)
        (openable blue_bin)
        (inReceptacle yellow_spray_bottle metal_rack)
        (inReceptacle silver_spray_bottle blue_bin)
        (not (atLocation robot yellow_spray_bottle))
        (not (atLocation robot silver_spray_bottle))
        (not (atLocation robot metal_rack))
        (not (atLocation robot blue_bin))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle yellow_spray_bottle metal_rack)
            (inReceptacle silver_spray_bottle metal_rack)
        )
    )
)