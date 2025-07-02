(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        purple - block
        blue - block
        green - block
        yellow - block
        red - block
        orange - block
        robot1 - robot
    )
    (:init
        (on purple blue)
        (on blue green)
        (on green yellow)
        (on yellow red)
        (ontable red)
        (clear purple)
        (clear orange)
        (handempty robot1)
        (holding robot1 nil)
    )
    (:goal
        (and
            (on purple blue)
            (clear blue)
            (on blue green)
            (clear green)
            (on green yellow)
            (clear yellow)
            (on yellow red)
            (clear red)
            (on red orange)
            (ontable orange)
            (clear orange)
        )
    )
)