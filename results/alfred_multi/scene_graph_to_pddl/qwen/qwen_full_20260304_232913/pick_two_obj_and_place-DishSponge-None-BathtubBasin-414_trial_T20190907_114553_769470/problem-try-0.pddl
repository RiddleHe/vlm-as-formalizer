(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent
        white_bathtub - sink
        black_trash_can - receptacle
        wooden_cabinet - receptacle
        green_sponge - object
        white_sponge - object
        brown_soap_bottle - object
        white_toilet_paper_roll - object
    )
    (:init
        (openable black_trash_can)
        (openable wooden_cabinet)
        (inReceptacle green_sponge black_trash_can)
        (inReceptacle white_sponge wooden_cabinet)
        (not (atLocation agent white_bathtub))
        (not (atLocation agent black_trash_can))
        (not (atLocation agent wooden_cabinet))
        (not (holdsAny agent))
    )
    (:goal (and
        (inReceptacle green_sponge white_bathtub)
        (inReceptacle white_sponge white_bathtub)
    ))
)