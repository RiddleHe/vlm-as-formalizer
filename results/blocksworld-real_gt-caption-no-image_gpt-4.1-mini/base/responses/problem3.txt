(define (problem blocksworld1)
    (:domain blocksworld)
    (:objects
        purple yellow red orange blue green - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (on blue green)
        (on orange blue)
        (on red orange)
        (on yellow red)
        (on purple yellow)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on purple red)
        (clear purple)
        (ontable yellow)
        (on orange yellow)
        (on green orange)
        (on blue green)
        (clear blue)
    ))
)