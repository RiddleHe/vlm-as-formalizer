(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        yellow_block - block
        orange_block - block
        green_block - block
        red_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block orange_block)
        (on orange_block red_block)
        (on red_block purple_block)
        (ontable purple_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on red_block blue_block)
  (on orange_block yellow_block)
  (on purple_block green_block)
)))
