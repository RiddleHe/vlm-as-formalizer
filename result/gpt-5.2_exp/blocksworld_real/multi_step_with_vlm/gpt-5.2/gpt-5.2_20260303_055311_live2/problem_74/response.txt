(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow_block - block
        green_block - block
        purple_block - block
        red_block - block
        blue_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block orange_block)
        (on green_block purple_block)
        (on red_block purple_block)
        (ontable purple_block)
        (ontable blue_block)
        (ontable orange_block)
        (clear yellow_block)
        (clear red_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on yellow_block green_block)
  (on green_block purple_block)
  (on purple_block red_block)
  (on red_block blue_block)
  (on blue_block orange_block)
)))
