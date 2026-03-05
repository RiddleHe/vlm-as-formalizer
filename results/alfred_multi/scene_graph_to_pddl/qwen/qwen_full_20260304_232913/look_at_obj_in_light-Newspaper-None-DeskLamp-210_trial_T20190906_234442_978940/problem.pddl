(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        robot - agent
        brown_sofa - receptacle
        round_table - receptacle
        lamp_base - receptacle
        green_lampshade - object
        red_chair - object
        newspaper - object
        remote_control - object
        laptop - object
        patterned_cushion - object
    )
    (:init
        (inReceptacle newspaper brown_sofa)
        (inReceptacle remote_control brown_sofa)
        (inReceptacle laptop brown_sofa)
        (inReceptacle patterned_cushion brown_sofa)
        (not (atLocation robot brown_sofa))
        (not (atLocation robot lamp_base))
        (not (isOn green_lampshade))
        (not (holdsAny robot))
    )
    (:goal (and
        (holds robot newspaper)
        (isOn green_lampshade)
    ))
)