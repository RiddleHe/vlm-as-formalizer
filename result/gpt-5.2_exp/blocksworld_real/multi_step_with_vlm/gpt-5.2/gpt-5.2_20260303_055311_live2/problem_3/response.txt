(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        blue_block - block
        orange_block - block
        red_block - block
        yellow_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block green_block)
        (on orange_block blue_block)
        (on red_block orange_block)
        (on yellow_block red_block)
        (on purple_block yellow_block)
        (ontable green_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on purple_block red_block)
    (on yellow_block orange_block)
    (on orange_block green_block)
    (on green_block blue_block)
    (ontable red_block)
    (ontable blue_block)
  )
))
