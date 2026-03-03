(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        blue_block - block
        orange_block - block
        yellow_block - block
        green_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (ontable blue_block)
        (ontable orange_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable purple_block)
        (clear red_block)
        (clear orange_block)
        (clear yellow_block)
        (clear green_block)
        (clear purple_block)
        (handempty robot_arm)
        (handfull robot_arm)
    )
    (:goal (and
  (on blue_block orange_block)
  (on orange_block purple_block)
  (on purple_block yellow_block)
  (on yellow_block green_block)
  (on green_block red_block)
)))
