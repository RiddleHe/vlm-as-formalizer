(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        orange_block - block
        red_block - block
        green_block - block
        yellow_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block blue_block)
        (on red_block green_block)
        (on green_block yellow_block)
        (ontable orange_block)
        (ontable yellow_block)
        (ontable purple_block)
        (clear blue_block)
        (clear red_block)
        (clear yellow_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on red_block yellow_block)
  (on yellow_block orange_block)
  (on orange_block blue_block)
  (on green_block purple_block)
)))
