(define (problem put_clock_on_desk)
    (:domain put_task)
    (:objects
        agent1 - agent
        wooden_cabinet_top - receptacle
        wooden_cabinet_bottom - receptacle
        wooden_desk - receptacle
        black_lamp - object
        black_monitor - object
        silver_clock - object
        black_smartphone - object
        cd_disc - object
    )
    (:init
        (openable wooden_cabinet_top)
        (openable wooden_cabinet_bottom)
        (isOn black_lamp)
        (isToggled black_lamp)
        (inReceptacle black_monitor wooden_cabinet_top)
        (inReceptacle silver_clock wooden_cabinet_bottom)
        (inReceptacle black_smartphone wooden_cabinet_bottom)
        (inReceptacle cd_disc wooden_desk)
    )
    (:goal (and (inReceptacle silver_clock wooden_desk)))
)