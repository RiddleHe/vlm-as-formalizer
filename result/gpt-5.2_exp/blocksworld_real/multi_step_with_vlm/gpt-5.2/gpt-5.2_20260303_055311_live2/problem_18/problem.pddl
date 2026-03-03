(define (problem blocksworld)    (:domain blocksworld)    (:objects
        purple_block - block
        orange_block - block
        green_block - block
        yellow_block - block
        blue_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on purple_block orange_block)
        (ontable orange_block)
        (ontable green_block)
        (clear purple_block)
        (clear green_block)
        (clear yellow_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on green_block purple_block)
  (on purple_block orange_block)
  (on orange_block yellow_block)
  (on yellow_block blue_block)
  (on blue_block red_block)
)))
