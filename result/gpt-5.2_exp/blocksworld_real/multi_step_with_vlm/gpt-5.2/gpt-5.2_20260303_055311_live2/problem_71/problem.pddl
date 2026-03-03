(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        purple_block - block
        red_block - block
        orange_block - block
        blue_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on red_block orange_block)
        (on blue_block yellow_block)
        (ontable green_block)
        (ontable purple_block)
        (ontable orange_block)
        (ontable yellow_block)
        (clear green_block)
        (clear purple_block)
        (clear red_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on purple_block blue_block)
    (on red_block orange_block)
    (on yellow_block green_block)
  )
))
