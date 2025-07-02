(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        green - block
        blue - block
        purple - block
        red - block
        robot1 - robot
    )
    (:init
        ; Currently stacked: green over blue, red over purple, orange on table
        (ontable green)
        (ontable red)
        (ontable orange)
        (clear red)
        (clear orange)
        (clear blue)
        (clear purple)
        (clear green)
        ; Assuming green is over blue as hinted in the blurry image
        (on green blue)
        ; Assuming red is over purple for the second stack
        (on red purple)
        (handempty robot1)
    )
    (:goal
        (and
            ; Green over blue over purple over orange
            (on green purple)
            (on blue orange)
            (on orange purple)
            (on yellow green)
            (on yellow blue)
            (clear red)
            (clear orange)
            (clear yellow)
            (handempty robot1)
        )
    )
)