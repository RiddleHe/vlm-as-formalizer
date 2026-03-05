(define (problem put_phone_on_bed)
    (:domain put_task)
    (:objects
        agent1 - agent
        phone - object
        desk - receptacle
        bed - receptacle
        trash_can - receptacle
        pen - object
        lamp - object
        dog - object
        chair - object
        laptop - object
        solar_panel - object
    )
    (:init
        (atLocation agent1 desk)
        (inReceptacle phone desk)
        (inReceptacle pen desk)
        (inReceptacle lamp desk)
        (inReceptacle dog bed)
        (inReceptacle laptop bed)
        (not (holdsAny agent1))
        (not (atLocation agent1 bed))
        (not (atLocation agent1 trash_can))
        (not (atLocation agent1 phone))
        (not (atLocation agent1 pen))
        (not (atLocation agent1 lamp))
        (not (atLocation agent1 dog))
        (not (atLocation agent1 chair))
        (not (atLocation agent1 laptop))
        (not (atLocation agent1 solar_panel))
    )
    (:goal
        (and
            (inReceptacle phone bed)
        )
    )
)