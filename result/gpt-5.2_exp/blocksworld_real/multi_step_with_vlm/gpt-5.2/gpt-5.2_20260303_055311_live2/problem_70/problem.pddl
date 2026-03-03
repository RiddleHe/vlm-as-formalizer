(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        blue_block - block
        yellow_block - block
        purple_block - block
        orange_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block green_block)
        (on yellow_block blue_block)
        (on purple_block yellow_block)
        (on orange_block purple_block)
        (ontable purple_block)
        (ontable red_block)
        (clear orange_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on yellow_block red_block)
  (on red_block orange_block)
  (on orange_block blue_block)
  (on blue_block purple_block)
  (on purple_block green_block)
)))
