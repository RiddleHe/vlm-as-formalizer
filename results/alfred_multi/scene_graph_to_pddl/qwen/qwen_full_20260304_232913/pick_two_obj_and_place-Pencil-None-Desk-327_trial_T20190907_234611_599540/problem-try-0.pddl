(define (problem put_two_pencils_on_desk)
    (:domain put_task)
    (:objects
        agent1 - agent
        white_desk - receptacle
        wooden_shelf - receptacle
        wooden_cabinet - receptacle
        gray_bowl - object
        set_of_keys - object
        cd_disc - object
        orange_pencil - object
        basketball - object
        black_office_chair - object
        digital_clock - object
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
    )
    (:init
        (openable wooden_cabinet)
        (isOn digital_clock)
        (isToggled digital_clock)
        (inReceptacle gray_bowl white_desk)
        (inReceptacle set_of_keys white_desk)
        (inReceptacle cd_disc wooden_shelf)
        (inReceptacle orange_pencil wooden_shelf)
        (inReceptacle basketball wooden_shelf)
        (inReceptacle digital_clock wooden_shelf)
    )
    (:goal (and
        (inReceptacle orange_pencil white_desk)
        (inReceptacle ?pencil2 white_desk)
        (not (inReceptacle ?pencil2 wooden_shelf))
    ))
)