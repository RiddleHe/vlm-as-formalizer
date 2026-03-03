(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow_block - block
        green_block - block
        purple_block - block
        red_block - block
        orange_block - block
        blue_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block green_block)
        (on green_block purple_block)
        (on red_block orange_block)
        (on blue_block orange_block)
        (ontable purple_block)
        (ontable blue_block)
        (clear yellow_block)
        (clear red_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on red_block yellow_block)
    (on yellow_block orange_block)
    (on green_block blue_block)
    (on blue_block purple_block)
  )
))
