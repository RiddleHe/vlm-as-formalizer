(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        red_block - block
        yellow_block - block
        green_block - block
        blue_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block red_block)
        (on green_block yellow_block)
        (on blue_block green_block)
        (on purple_block blue_block)
        (ontable purple_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on green_block blue_block)
    (on purple_block orange_block)
    (on red_block yellow_block)
  )
))
