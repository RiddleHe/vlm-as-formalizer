(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        red_block - block
        orange_block - block
        purple_block - block
        green_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block orange_block)
        (on red_block purple_block)
        (on orange_block green_block)
        (on purple_block green_block)
        (on green_block yellow_block)
        (ontable yellow_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on red_block blue_block)
  (on blue_block green_block)
  (on green_block yellow_block)
  (on yellow_block orange_block)
  (on orange_block purple_block)
)))
