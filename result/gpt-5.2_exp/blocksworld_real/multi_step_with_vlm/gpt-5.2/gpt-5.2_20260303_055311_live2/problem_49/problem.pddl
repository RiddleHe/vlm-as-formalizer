(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        yellow_block - block
        orange_block - block
        green_block - block
        purple_block - block
        blue_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block yellow_block)
        (ontable red_block)
        (ontable yellow_block)
        (ontable green_block)
        (clear orange_block)
        (clear green_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on red_block yellow_block)
  (on yellow_block orange_block)
  (on orange_block green_block)
  (on green_block purple_block)
  (on purple_block blue_block)
)))
