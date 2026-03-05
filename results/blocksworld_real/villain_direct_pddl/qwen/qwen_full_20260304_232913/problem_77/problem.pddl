(define (problem blocksworld1)
    (:domain blocksworld)
    (:objects
        green_block - block
        red_block - block
        yellow_block - block
        orange_block - block
        purple_block - block
        blue_block - block
        robot1 - robot
    )
    (:init
        (on green_block red_block)
        (on red_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block purple_block)
        (ontable purple_block)
        (clear green_block)
        (ontable blue_block)
        (clear blue_block)
        (handempty robot1)
    )
    (:goal (and
        (on blue_block purple_block)
        (on purple_block green_block)
        (on green_block red_block)
        (on red_block yellow_block)
        (on yellow_block orange_block)
        (ontable orange_block)
        (clear blue_block)
    ))
)