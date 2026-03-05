(define (problem put_phones_on_dresser)
    (:domain put_task)
    (:objects
        robot - agent
        phone1 phone2 - object
        dresser - receptacle
        bed - object
        lamp clock pen keys - object
    )
    (:init
        (atLocation robot bed)
        (inReceptacle phone1 bed)
        (atLocation robot lamp)
        (inReceptacle phone2 lamp)
        (inReceptacle lamp dresser)
        (inReceptacle clock dresser)
        (inReceptacle pen dresser)
        (inReceptacle keys dresser)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle phone1 dresser)
        (inReceptacle phone2 dresser)
    ))
)