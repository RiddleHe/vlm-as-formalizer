(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        red_block - block
        yellow_block - block
        orange_block - block
        purple_block - block
        blue_block - block
        robot_arm - robot
    )
    (:init
        (on green_block red_block)
        (on red_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block purple_block)
        (ontable purple_block)
        (ontable blue_block)
        (clear green_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on blue_block purple_block)
    (on purple_block green_block)
    (on green_block red_block)
    (on red_block yellow_block)
    (on yellow_block orange_block)
    (ontable orange_block)
  )
))
