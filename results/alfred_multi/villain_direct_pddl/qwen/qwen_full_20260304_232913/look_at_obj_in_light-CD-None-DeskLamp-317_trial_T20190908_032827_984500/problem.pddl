(define (problem inspect_cd_by_lamp)
    (:domain put_task)
    (:objects
        robot - agent
        cd - object
        lamp - object
        table - object
        nightstand - object
    )
    (:init
        (atLocation robot table)
        (inReceptacle cd table)
        (isOn lamp)
    )
    (:goal (and
        (atLocation robot nightstand)
        (holds robot cd)
    ))
)