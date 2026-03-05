(define (problem put_soap_on_rack)
    (:domain put_task)
    (:objects
        robot - agent
        sink - receptacle
        steel_rack - receptacle
        recycling_bin - receptacle
        pink_soap - object
        brown_cylinder - object
        green_object - object
    )
    (:init
        (openable steel_rack)
        (openable recycling_bin)
        (opened steel_rack)
        (opened recycling_bin)
        (inReceptacle brown_cylinder steel_rack)
        (inReceptacle green_object steel_rack)
        (inReceptacle pink_soap sink)
        (atLocation robot sink)  ; robot starts near sink where soap is
    )
    (:goal (and
        (inReceptacle pink_soap steel_rack)
        (inReceptacle green_object steel_rack)  ; already there, but goal requires two bars of soap — assuming green_object is the second soap
    ))
)