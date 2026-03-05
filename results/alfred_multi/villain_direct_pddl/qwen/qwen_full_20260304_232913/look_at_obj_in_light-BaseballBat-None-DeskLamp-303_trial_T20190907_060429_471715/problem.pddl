(define (problem turn_on_lamp_to_examine_bat)
    (:domain put_task)
    (:objects
        robot - agent
        lamp - object
        bat - object
        table - receptacle
    )
    (:init
        (atLocation robot table)
        (inReceptacle bat table)
        (inReceptacle lamp table)
        (not (isOn lamp))
    )
    (:goal (and (isOn lamp) (atLocation robot bat)))
)