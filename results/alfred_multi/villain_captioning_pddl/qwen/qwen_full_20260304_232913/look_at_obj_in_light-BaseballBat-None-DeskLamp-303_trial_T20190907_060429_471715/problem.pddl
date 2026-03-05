(define (problem turn_on_lamp_to_examine_bat)
    (:domain put_task)
    (:objects
        robot - agent
        lamp - object
        baseball_bat - object
        wooden_table - object
        nightstand - object
        bed - object
        book - object
        glasses - object
        cup - object
    )
    (:init
        (atLocation robot wooden_table) ; Assuming robot starts near the table for practicality; if not specified, could be omitted or set to a default
        (not (isOn lamp))
        (not (atLocation robot baseball_bat))
        (not (atLocation robot nightstand))
        (not (atLocation robot bed))
        (not (atLocation robot book))
        (not (atLocation robot glasses))
        (not (atLocation robot cup))
        (inReceptacle lamp wooden_table)
        (inReceptacle glasses wooden_table)
        (inReceptacle cup wooden_table)
        (inReceptacle book bed)
        (not (holdsAny robot))
    )
    (:goal (and (isOn lamp) (atLocation robot baseball_bat)))
)