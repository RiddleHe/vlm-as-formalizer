(define (problem put_clock_on_desk)
    (:domain put_task)
    (:objects
        robot - agent
        clock - object
        desk - receptacle
        lamp - object
        cd - object
        phone - object
    )
    (:init
        (atLocation robot clock)
        (not (holdsAny robot))
        (not (inReceptacle clock desk))
        (openable desk)
        (not (opened desk))
    )
    (:goal (and (inReceptacle clock desk)))
)