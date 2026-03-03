(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        yellow_block - block
        purple_block - block
        green_block - block
        blue_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block orange_block)
        (on purple_block yellow_block)
        (on green_block purple_block)
        (on blue_block green_block)
        (on red_block blue_block)
        (ontable red_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on red_block purple_block)
    (on yellow_block green_block)
    (on green_block orange_block)
    (on orange_block blue_block)
    (ontable purple_block)
    (ontable blue_block)
    (clear red_block)
    (clear yellow_block)
  )
))
