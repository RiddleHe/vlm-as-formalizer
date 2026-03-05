(define (problem put_spatulas_in_drawer)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_counter_drawer - receptacle
        spatula_on_counter_left - object
        spatula_on_counter_right - object
        loaf_of_bread_left - object
        loaf_of_bread_right - object
        photos_on_counter_left - object
        photos_on_counter_right - object
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
    )
    (:init
        (openable wooden_counter_drawer)
        (not (opened wooden_counter_drawer))
        (atLocation robot wooden_counter_drawer)
        (not (holdsAny robot))
        (not (inReceptacle spatula_on_counter_left wooden_counter_drawer))
        (not (inReceptacle spatula_on_counter_right wooden_counter_drawer))
    )
    (:goal
        (and
            (inReceptacle spatula_on_counter_left wooden_counter_drawer)
            (inReceptacle spatula_on_counter_right wooden_counter_drawer)
        )
    )
)