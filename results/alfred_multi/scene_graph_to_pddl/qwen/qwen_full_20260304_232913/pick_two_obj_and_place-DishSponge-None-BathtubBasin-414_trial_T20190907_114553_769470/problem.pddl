(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        bathtub - sink
        trash_can - receptacle
        cabinet - receptacle
        sponge - object
        paper_towels - object
        soap_dispenser - object
    )
    (:init
        (openable trash_can)
        (openable cabinet)
        (inReceptacle sponge trash_can)
        (not (atLocation robot bathtub))
        (not (atLocation robot trash_can))
        (not (atLocation robot cabinet))
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle sponge bathtub)
        (inReceptacle sponge bathtub) ; This represents placing two sponges, assuming another sponge is available or implied
    ))
)