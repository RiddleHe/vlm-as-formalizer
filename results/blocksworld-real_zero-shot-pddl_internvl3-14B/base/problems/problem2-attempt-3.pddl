(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        green - block
        red - block
        purple - block
        blue - block
        orange - block
        yellow - block
    )
    (:init
        (handempty robot1)
        (ontable yellow)
        (clear green)
        (clear red)
        (clear purple)
        (clear blue)
        (clear orange)
        (on red purple)
        (on purple blue)
        (on blue orange)
    )
    (:goal 
        (and
            (clear green)
            (on green red)
            (on red purple)
            (on purple blue)
            (on blue orange)
            (on orange yellow)
            (ontable yellow)
            (handempty robot1)
        )
    )
)