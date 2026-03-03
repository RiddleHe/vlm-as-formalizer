(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        green_block - block
        red_block - block
        purple_block - block
        yellow_block - block
        blue_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block green_block)
        (on green_block red_block)
        (on red_block purple_block)
        (on purple_block yellow_block)
        (on yellow_block blue_block)
        (ontable blue_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on blue_block orange_block)
  (on orange_block green_block)
  (on green_block purple_block)
  (on purple_block yellow_block)
  (on yellow_block red_block)
  (ontable red_block)
  (clear blue_block)
)))
