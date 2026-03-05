(define (problem put_clock_on_desk)
    (:domain put_task)
    (:objects
        agent
        wooden_cabinet - receptacle
        wooden_desk - receptacle
        black_lamp - object
        black_monitor - object
        gray_clock - object
        black_phone - object
        cd_disc - object
    )
    (:init
        (openable wooden_cabinet)
        (isOn black_lamp)
        (isToggled black_lamp)
        (inReceptacle black_monitor wooden_cabinet)
        (inReceptacle gray_clock wooden_desk)
        (inReceptacle black_phone wooden_desk)
        (inReceptacle cd_disc wooden_desk)
    )
    (:goal (and (inReceptacle gray_clock wooden_desk)))
)