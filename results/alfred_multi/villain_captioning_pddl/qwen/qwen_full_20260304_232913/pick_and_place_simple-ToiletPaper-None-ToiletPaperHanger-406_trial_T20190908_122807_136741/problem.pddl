(define (problem move_toilet_paper)
    (:domain put_task)
    (:objects
        robot - agent
        toilet_paper_roll - object
        toilet_paper_dispenser - receptacle
        sink - sink
        countertop - receptacle
    )
    (:init
        (atLocation robot sink) ; robot starts near sink (arbitrary starting point; could be anywhere not at the roll or dispenser)
        (inReceptacle toilet_paper_roll countertop) ; toilet paper roll is on the countertop
        (openable toilet_paper_dispenser) ; dispenser is openable (assumed for the sake of the task)
        (not (opened toilet_paper_dispenser)) ; dispenser is initially closed (if it were a cabinet; but for a dispenser, we can assume it's always "open" for placement; however, to use OpenObject, we set it as closed and then open it)
        (not (holdsAny robot)) ; robot is not holding anything
        (not (atLocation robot toilet_paper_roll)) ; robot is not at the roll
        (not (atLocation robot toilet_paper_dispenser)) ; robot is not at the dispenser
    )
    (:goal (and
        (inReceptacle toilet_paper_roll toilet_paper_dispenser)
    ))
)