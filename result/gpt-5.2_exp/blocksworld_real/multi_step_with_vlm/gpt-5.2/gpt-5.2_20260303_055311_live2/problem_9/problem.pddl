(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        blue_block - block
        red_block - block
        green_block - block
        yellow_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block yellow_block)
        (on red_block purple_block)
        (on yellow_block green_block)
        (ontable orange_block)
        (ontable green_block)
        (clear blue_block)
        (clear red_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on orange_block blue_block)
    (on red_block green_block)
    (on yellow_block purple_block)
  )
))
