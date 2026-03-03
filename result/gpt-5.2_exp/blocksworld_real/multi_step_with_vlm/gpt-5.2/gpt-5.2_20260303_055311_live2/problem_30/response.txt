(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        purple_block - block
        green_block - block
        blue_block - block
        yellow_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block red_block)
        (on green_block purple_block)
        (on yellow_block purple_block)
        (ontable blue_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on orange_block purple_block)
  (on purple_block green_block)
  (on green_block blue_block)
  (on blue_block yellow_block)
  (on yellow_block red_block)
)))
