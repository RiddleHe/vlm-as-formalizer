(define (problem put_pencils_on_desk)
    (:domain put_task)
    (:objects
        agent1 - agent
        desk - receptacle
        pencil1 pencil2 - object
    )
    (:init
        (atLocation agent1 desk)
        (inReceptacle pencil1 desk)
        (inReceptacle pencil2 desk)
    )
    (:goal (and (inReceptacle pencil1 desk) (inReceptacle pencil2 desk)))
)