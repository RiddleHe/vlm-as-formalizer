(define (problem blocksworld)    (:domain blocksworld)    (:objects
        purple_block - block
        blue_block - block
        green_block - block
        orange_block - block
        red_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on purple_block blue_block)
        (on blue_block green_block)
        (on yellow_block red_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable yellow_block)
        (clear purple_block)
        (clear orange_block)
        (clear red_block)
        (clear yellow_block)
        (handempty robot_arm)
        (handfull robot_arm)
    )
    (:goal (and 
  (on blue_block orange_block)
  (on orange_block green_block)
  (on green_block purple_block)
  (on purple_block red_block)
  (on red_block yellow_block)
)))
