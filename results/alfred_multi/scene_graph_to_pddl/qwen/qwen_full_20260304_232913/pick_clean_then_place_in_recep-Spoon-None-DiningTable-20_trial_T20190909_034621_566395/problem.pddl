(define (problem stand_cleaned_spoon_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        stainless_steel_sink - sink
        yellow_handled_knife - knife
        silver_knife - knife
        green_bottle - object
        fork - object
        pot - object
        egg - object
        mug - object
        green_book - object
        tomato - object
        lettuce - object
        potato - object
        bowl - object
        coffee_maker - object
        toaster - object
    )
    (:init
        (openable stainless_steel_sink)
        (isOn toaster)
        (isToggled toaster)
        (inReceptacle egg stainless_steel_sink)
        (inReceptacle green_book stainless_steel_sink)
        (inReceptacle mug stainless_steel_sink)
        (atLocation robot stainless_steel_sink) ; assuming robot starts near sink for cleaning task
    )
    (:goal (and
        (isClean fork) ; assuming "spoon" refers to "fork" as no spoon is present
        (atLocation robot fork) ; robot must be at fork's location after cleaning
    ))
)