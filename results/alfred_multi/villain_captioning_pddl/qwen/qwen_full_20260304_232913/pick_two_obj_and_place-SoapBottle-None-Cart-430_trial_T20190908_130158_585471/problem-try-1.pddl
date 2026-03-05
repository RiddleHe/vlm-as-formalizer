(define (problem put_two_spray_bottles_on_rack)
    (:domain put_task)
    (:objects
        robot - agent
        yellow_spray_bottle silver_spray_bottle - object
        metal_rack toilet - receptacle
    )
    (:init
        (atLocation robot toilet) ; robot starts near the toilet where the silver bottle is
        (inReceptacle yellow_spray_bottle metal_rack) ; yellow bottle already on rack
        ; silver bottle is on toilet tank, which is not a receptacle per domain, so we model it as being at the toilet location
        (atLocation silver_spray_bottle toilet)
        ; metal_rack is not openable, so no opened/closed state needed
        ; toilet is not openable in this context
    )
    (:goal (and
        (inReceptacle yellow_spray_bottle metal_rack)
        (inReceptacle silver_spray_bottle metal_rack)
    ))
)