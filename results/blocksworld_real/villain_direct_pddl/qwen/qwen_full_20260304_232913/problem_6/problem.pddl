(define (problem blocksworld1)
    (:domain blocksworld)
    (:objects
        blue_block - block
        orange_block - block
        red_block - block
        purple_block - block
        green_block - block
        yellow_block - block
        robot1 - robot
    )
    (:init
        (ontable blue_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable purple_block)
        (ontable green_block)
        (ontable yellow_block)
        (clear blue_block)
        (clear orange_block)
        (clear red_block)
        (clear purple_block)
        (clear green_block)
        (clear yellow_block)
        (handempty robot1)
    )
    (:goal (and
        (on blue_block orange_block)
        (on orange_block red_block)
        (on red_block purple_block)
        (on purple_block green_block)
        (on green_block yellow_block)
        (ontable yellow_block)
    ))
)