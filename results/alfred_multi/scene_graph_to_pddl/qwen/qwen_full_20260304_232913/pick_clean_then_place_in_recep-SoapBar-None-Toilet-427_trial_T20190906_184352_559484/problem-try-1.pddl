(define (problem put_clean_soap_on_toilet)
    (:domain put_task)
    (:objects
        agent
        sink - receptacle
        toilet - receptacle
        bathtub - receptacle
        pink_bar_of_soap - object
        green_bar_of_soap - object
        yellow_toothbrush - object
        white_toilet_paper_roll - object
        knife - object
    )
    (:init
        (atLocation agent sink) ; assuming agent starts near sink for accessibility
        (inReceptacle pink_bar_of_soap bathtub)
        (inReceptacle green_bar_of_soap bathtub)
        (inReceptacle yellow_toothbrush toilet)
        (inReceptacle white_toilet_paper_roll toilet)
        (not (isClean pink_bar_of_soap))
        (not (isClean green_bar_of_soap))
    )
    (:goal
        (and
            (inReceptacle pink_bar_of_soap toilet)
            (isClean pink_bar_of_soap)
        )
    )
)