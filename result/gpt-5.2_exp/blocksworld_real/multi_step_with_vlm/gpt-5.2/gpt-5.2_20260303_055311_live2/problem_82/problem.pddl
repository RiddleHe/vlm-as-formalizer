(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        yellow_block - block
        red_block - block
        orange_block - block
        green_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block red_block)
        (on red_block orange_block)
        (on orange_block green_block)
        (ontable green_block)
        (ontable purple_block)
        (clear blue_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on red_block blue_block)
  (on yellow_block green_block)
  (on green_block orange_block)
  (on orange_block purple_block)
)))
