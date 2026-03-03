(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        yellow_block - block
        blue_block - block
        orange_block - block
        purple_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on green_block blue_block)
        (on yellow_block orange_block)
        (on blue_block orange_block)
        (on orange_block purple_block)
        (on purple_block red_block)
        (ontable red_block)
        (clear green_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on green_block blue_block)
  (on blue_block yellow_block)
  (on yellow_block purple_block)
  (on purple_block orange_block)
  (on orange_block red_block)
  (ontable red_block)
)))
