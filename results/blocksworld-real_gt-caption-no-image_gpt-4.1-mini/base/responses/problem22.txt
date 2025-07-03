(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        orange red blue green purple yellow - block
    )
    (:init
        (handempty robot1)
        (clear orange)
        (on orange red)
        (on red blue)
        (on blue green)
        (on green purple)
        (on purple yellow)
        (ontable yellow)
    )
    (:goal (and
        (on green orange)
        (clear green)

        (on purple yellow)
        (on yellow red)
        (on red blue)
        (clear purple)
    ))
)