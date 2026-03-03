(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        orange_block - block
        purple_block - block
        red_block - block
        yellow_block - block
        green_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block blue_block)
        (on purple_block orange_block)
        (on red_block yellow_block)
        (ontable blue_block)
        (ontable yellow_block)
        (ontable green_block)
        (clear purple_block)
        (clear red_block)
        (clear green_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on green_block red_block)
  (on red_block orange_block)
  (on orange_block purple_block)
  (on purple_block blue_block)
  (on blue_block yellow_block)
)))
