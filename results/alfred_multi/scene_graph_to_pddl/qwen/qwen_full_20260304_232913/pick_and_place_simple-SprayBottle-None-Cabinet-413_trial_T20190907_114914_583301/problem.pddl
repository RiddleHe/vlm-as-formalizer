(define (problem put_spray_bottle_in_cabinet)
    (:domain put_task)
    (:objects
        robot - agent
        green_spray_bottle - object
        toilet_tank - receptacle
        white_bathroom_vanity_cabinet - receptacle
        red_trash_bin - receptacle
        toilet_paper_roll - object
        beige_oval_sink_on_white_vanity - sink
        second_beige_oval_sink_on_white_vanity - sink
    )
    (:init
        (openable white_bathroom_vanity_cabinet)
        (not (opened white_bathroom_vanity_cabinet))
        (inReceptacle toilet_paper_roll red_trash_bin)
        (inReceptacle green_spray_bottle toilet_tank)
        (isOn green_spray_bottle)
        (not (atLocation robot toilet_tank))
        (not (atLocation robot white_bathroom_vanity_cabinet))
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle green_spray_bottle white_bathroom_vanity_cabinet)
        )
    )
)