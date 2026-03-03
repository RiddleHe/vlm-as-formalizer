(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        blue_block - block
        purple_block - block
        yellow_block - block
        orange_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on purple_block blue_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable yellow_block)
        (ontable red_block)
        (clear green_block)
        (clear purple_block)
        (clear yellow_block)
        (clear orange_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and 
  (on green_block blue_block)
  (on blue_block purple_block)
  (on yellow_block orange_block)
  (on orange_block red_block)
)))
