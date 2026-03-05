(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red_block - block
        yellow_block - block
        orange_block - block
        green_block - block
        purple_block - block
        blue_block - block
        robot1 - robot
    )
    (:init
        ; Initial stacking: purple on blue, blue on red (left stack)
        (on purple_block blue_block)
        (on blue_block red_block)
        (ontable red_block)
        (clear purple_block)

        ; Single green block on table
        (ontable green_block)
        (clear green_block)

        ; Yellow on orange (right stack)
        (on yellow_block orange_block)
        (ontable orange_block)
        (clear yellow_block)

        ; Robot is handempty
        (handempty robot1)
    )
    (:goal (and
        ; Goal: red over yellow over orange over green over purple over blue
        ; This means: red is on table, yellow on red, orange on yellow, green on orange, purple on green, blue on purple
        (ontable red_block)
        (on yellow_block red_block)
        (on orange_block yellow_block)
        (on green_block orange_block)
        (on purple_block green_block)
        (on blue_block purple_block)

        ; All blocks above the bottom one must be clear of anything on top
        (clear blue_block)
        (clear purple_block)
        (clear green_block)
        (clear orange_block)
        (clear yellow_block)
    ))
)