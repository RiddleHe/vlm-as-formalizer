(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        yellow_block - block
        blue_block - block
        purple_block - block
        red_block - block
        green_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block yellow_block)
        (on yellow_block blue_block)
        (on purple_block red_block)
        (on red_block green_block)
        (ontable blue_block)
        (ontable green_block)
        (clear orange_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on purple_block blue_block)
  (on blue_block green_block)
  (on green_block red_block)
  (on red_block orange_block)
  (on orange_block yellow_block)
)))
