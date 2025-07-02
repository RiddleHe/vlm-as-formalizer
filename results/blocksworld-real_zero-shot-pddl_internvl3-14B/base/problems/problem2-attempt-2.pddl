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
        (on orange purple)
        (on purple orange)
        (on green purple)
        (on light_blue orange)
        (on orange not_present)
        (clear green)
        (clear red)
        (clear blue)
        (clear yellow)
        (ontable yellow)
    )
    (:goal 
        (and
            (clear red)
            (clear blue)
            (clear yellow)
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