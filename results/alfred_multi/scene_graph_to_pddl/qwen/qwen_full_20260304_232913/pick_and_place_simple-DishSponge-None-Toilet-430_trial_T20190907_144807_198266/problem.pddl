(define (problem place_green_sponge_on_toilet_tank)
    (:domain put_task)
    (:objects
        robot - agent
        green_sponge - object
        white_toilet_with_tank - receptacle
        white_oval_bathtub_with_chrome_faucet - receptacle
        glass_shower_enclosure - receptacle
        wooden_stool_leg - object
    )
    (:init
        (openable white_toilet_with_tank)
        (openable glass_shower_enclosure)
        (atLocation robot white_oval_bathtub_with_chrome_faucet) ; assuming robot starts near bathtub
        (not (holdsAny robot))
    )
    (:goal
        (and
            (inReceptacle green_sponge white_toilet_with_tank)
        )
    )
)