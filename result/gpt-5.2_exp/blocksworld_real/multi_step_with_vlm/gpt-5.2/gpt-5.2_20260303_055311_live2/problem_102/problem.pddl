(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        red_block - block
        orange_block - block
        blue_block - block
        purple_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on green_block blue_block)
        (on blue_block yellow_block)
        (ontable orange_block)
        (clear green_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on green_block red_block)
  (on red_block orange_block)
  (on orange_block blue_block)
  (on blue_block purple_block)
  (on purple_block yellow_block)
)))
