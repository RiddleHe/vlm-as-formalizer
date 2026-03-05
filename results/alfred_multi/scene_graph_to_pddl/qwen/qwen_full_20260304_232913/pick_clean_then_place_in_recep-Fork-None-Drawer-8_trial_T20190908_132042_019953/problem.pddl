(define (problem put_clean_fork_in_drawer)
    (:domain put_task)
    (:objects
        robot - agent
        stainless_steel_sink - sink
        fork - object
        drawer - receptacle
        green_lettuce - object
        round_brown_pie - object
        loaf_of_bread - object
        egg - object
        blue_pen - object
        soap_dispenser - object
        silver_knife - knife
    )
    (:init
        (openable stainless_steel_sink)
        (inReceptacle egg stainless_steel_sink)
        (not (atLocation robot stainless_steel_sink))
        (not (atLocation robot fork))
        (not (atLocation robot drawer))
        (not (holdsAny robot))
        (not (isClean fork))
        (not (opened drawer))
        (not (isOn drawer))
    )
    (:goal
        (and
            (inReceptacle fork drawer)
            (isClean fork)
        )
    )
)