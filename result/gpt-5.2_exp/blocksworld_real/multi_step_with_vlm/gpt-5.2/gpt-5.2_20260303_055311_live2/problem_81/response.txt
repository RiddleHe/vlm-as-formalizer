(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow_block - block
        purple_block - block
        blue_block - block
        green_block - block
        red_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on purple_block blue_block)
        (on blue_block green_block)
        (on green_block red_block)
        (ontable red_block)
        (ontable orange_block)
        (clear yellow_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and 
  (on green_block red_block)
  (on purple_block yellow_block)
  (on blue_block orange_block)
)))
