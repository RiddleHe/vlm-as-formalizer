(define (problem put_clean_soap_on_toilet)
    (:domain put_task)
    (:objects
        agent
        sink - receptacle
        toilet - receptacle
        pink_bar_of_soap - object
        green_bar_of_soap - object
    )
    (:init
        (atLocation agent sink)
        (inReceptacle pink_bar_of_soap sink)
        (inReceptacle green_bar_of_soap sink)
    )
    (:goal (and
        (inReceptacle pink_bar_of_soap toilet)
        (isClean pink_bar_of_soap)
    ))
)