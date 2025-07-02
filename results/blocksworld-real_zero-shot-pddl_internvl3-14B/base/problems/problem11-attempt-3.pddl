(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        green - block
        blue - block
        red - block
        purple - block
        robot1 - robot
    )
    (:init
        ; Initial placement on table
        (ontable orange)
        (ontable yellow)
        ; Assuming some blocks are already stacked based on the scene and the instruction
        (on green blue)
        (on red purple)
        ; All blocks are clear except for those directly under other blocks
        (clear orange)
        (clear yellow)
        (clear purple)
        (handempty robot1)
    )
    (:goal
        (and
            ; Final goal setup: green over blue over purple over orange
            (on green blue)
            (on blue purple)
            (on purple orange)
            ; Separate stack: red over yellow
            (on red yellow)
            (clear green)
            (clear red)
        )
    )
)