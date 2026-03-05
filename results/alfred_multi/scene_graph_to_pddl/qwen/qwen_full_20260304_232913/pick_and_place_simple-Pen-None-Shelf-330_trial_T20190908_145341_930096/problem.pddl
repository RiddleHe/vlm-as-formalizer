(define (problem move_pen_to_dresser)
    (:domain put_task)
    (:objects
        robot - agent
        pen - object
        dark_wooden_dresser - receptacle
        hexagonal_bin - receptacle
    )
    (:init
        (openable dark_wooden_dresser)
        (openable hexagonal_bin)
        (inReceptacle pen hexagonal_bin)
    )
    (:goal (and (inReceptacle pen dark_wooden_dresser)))
)