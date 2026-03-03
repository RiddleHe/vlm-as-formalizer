(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        blue_block - block
        purple_block - block
        red_block - block
        green_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block purple_block)
        (on purple_block red_block)
        (on green_block yellow_block)
        (ontable red_block)
        (clear orange_block)
        (clear green_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on green_block red_block)
  (on red_block purple_block)
  (on purple_block blue_block)
  (on blue_block orange_block)
  (on orange_block yellow_block)
  (ontable yellow_block)
  (clear green_block)
)))
