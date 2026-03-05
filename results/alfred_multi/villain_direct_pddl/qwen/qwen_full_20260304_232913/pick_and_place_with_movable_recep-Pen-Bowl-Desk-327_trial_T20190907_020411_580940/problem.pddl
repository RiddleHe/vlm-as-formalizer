(define (problem put_pen_in_bowl)
    (:domain put_task)
    (:objects
        agent1 - agent
        pen - object
        bowl1 bowl2 - receptacle
        desk1 desk2 - object
        cd - object
        boots - object
        basketball - object
        laptop - object
        chair - object
        lamp - object
        clock - object
    )
    (:init
        (atLocation agent1 desk1)
        (inReceptacle pen desk1)
        (inReceptacle bowl1 desk1)
        (inReceptacle bowl2 desk1)
        (inReceptacle cd desk1)
        (inReceptacle boots desk1)
        (inReceptacle basketball desk1)
        (inReceptacle laptop desk2)
        (inReceptacle chair desk2)
        (inReceptacle lamp desk1)
        (inReceptacle clock desk1)
        (openable bowl1)
        (openable bowl2)
    )
    (:goal (and
        (inReceptacle pen bowl1)
        (inReceptacle bowl1 desk1)
    ))
)