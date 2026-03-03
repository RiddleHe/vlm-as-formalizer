(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        green_block - block
        blue_block - block
        yellow_block - block
        purple_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block blue_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable purple_block)
        (ontable red_block)
        (clear orange_block)
        (clear green_block)
        (clear yellow_block)
        (clear purple_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on blue_block green_block)
  (on green_block red_block)
  (on red_block yellow_block)
  (on yellow_block orange_block)
  (on orange_block purple_block)
)))
