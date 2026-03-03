(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        green_block - block
        orange_block - block
        yellow_block - block
        purple_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on green_block orange_block)
        (on yellow_block purple_block)
        (on red_block purple_block)
        (ontable blue_block)
        (ontable orange_block)
        (ontable purple_block)
        (clear blue_block)
        (clear green_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on orange_block yellow_block)
  (on yellow_block purple_block)
  (on purple_block red_block)
  (on red_block blue_block)
  (on blue_block green_block)
)))
