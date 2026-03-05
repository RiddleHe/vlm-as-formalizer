(define (problem put_two_pencils_on_desk)
    (:domain put_task)
    (:objects
        robot - agent
        wooden_table - receptacle
        wooden_shelf - receptacle
        wooden_cabinet - receptacle
        black_office_chair - receptacle
        gray_bowl - object
        set_of_keys - object
        cd - object
        orange_pencil - object
        basketball - object
        knife - object
    )
    (:init
        (openable wooden_cabinet)
        (inReceptacle gray_bowl wooden_table)
        (inReceptacle set_of_keys wooden_table)
        (inReceptacle cd wooden_shelf)
        (inReceptacle orange_pencil wooden_shelf)
        (inReceptacle basketball wooden_shelf)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle orange_pencil wooden_table)
        (inReceptacle orange_pencil wooden_table)  ; This is a placeholder; only one pencil exists. Adjust if another pencil is present.
    ))
)