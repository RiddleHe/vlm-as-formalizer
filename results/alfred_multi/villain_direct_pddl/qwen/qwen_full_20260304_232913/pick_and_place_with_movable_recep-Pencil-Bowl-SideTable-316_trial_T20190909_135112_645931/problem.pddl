(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        bowl - receptacle
        pencil - object
        nightstand - receptacle
        desk - receptacle
        laptop - object
        monitor - object
        book - object
        cd - object
        trashcan - receptacle
        bed - object
    )
    (:init
        (atLocation agent1 desk)
        (inReceptacle pencil desk)
        (inReceptacle bowl desk)
        (inReceptacle book desk)
        (inReceptacle cd desk)
        (inReceptacle laptop desk)
        (inReceptacle monitor desk)
        (inReceptacle trashcan desk)
        (inReceptacle nightstand bed)
        (openable bowl)
        (openable nightstand)
        (not (holdsAny agent1))
    )
    (:goal
        (and
            (inReceptacle pencil bowl)
            (inReceptacle bowl nightstand)
        )
    )
)