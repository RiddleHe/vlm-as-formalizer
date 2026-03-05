(define (problem put_two_pencils_on_desk)
    (:domain put_task)
    (:objects
        agent
        wooden_cabinet - receptacle
        desk - receptacle
        shelf - receptacle
        pencil1 - object
        pencil2 - object
        cd - object
        basketball - object
        keys - object
        bowl - object
        chair - object
    )
    (:init
        (openable wooden_cabinet)
        (inReceptacle pencil1 shelf)
        (inReceptacle pencil2 shelf)
        (inReceptacle cd shelf)
        (inReceptacle keys shelf)
        (inReceptacle bowl desk)
        (not (holdsAny agent))
    )
    (:goal (and
        (inReceptacle pencil1 desk)
        (inReceptacle pencil2 desk)
    ))
)