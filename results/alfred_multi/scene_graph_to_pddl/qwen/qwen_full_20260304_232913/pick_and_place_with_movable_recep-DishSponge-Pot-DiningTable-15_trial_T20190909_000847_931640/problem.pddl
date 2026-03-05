(define (problem put_pot_with_sponge_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        cabinet_above_microwave - receptacle
        cabinet_left_of_microwave - receptacle
        cabinet_right_of_microwave - receptacle
        knife - knife
        tomato - object
        egg - object
        pot_left_burner - object
        pot_right_burner - object
        table - receptacle
        stool - object
    )
    (:init
        (openable microwave)
        (openable cabinet_above_microwave)
        (openable cabinet_left_of_microwave)
        (openable cabinet_right_of_microwave)
        (isOn microwave)
        (isOn pot_left_burner)
        (isOn pot_right_burner)
        (isToggled microwave)
        (not (holdsAny robot))
        (not (atLocation robot microwave))
        (not (atLocation robot cabinet_above_microwave))
        (not (atLocation robot cabinet_left_of_microwave))
        (not (atLocation robot cabinet_right_of_microwave))
        (not (atLocation robot knife))
        (not (atLocation robot tomato))
        (not (atLocation robot egg))
        (not (atLocation robot pot_left_burner))
        (not (atLocation robot pot_right_burner))
        (not (atLocation robot table))
        (not (atLocation robot stool))
    )
    (:goal (and
        (inReceptacle pot_left_burner table)
        (inReceptacle pot_right_burner table)
    ))
)