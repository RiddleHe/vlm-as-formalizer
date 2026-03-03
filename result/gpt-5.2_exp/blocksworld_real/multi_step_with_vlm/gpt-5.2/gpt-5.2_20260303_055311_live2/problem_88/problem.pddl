(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        blue_block - block
        green_block - block
        purple_block - block
        red_block - block
        yellow_block - block
        robot_1 - robot
    )
    (:init
        (on blue_block orange_block)
        (on blue_block green_block)
        (on red_block yellow_block)
        (ontable green_block)
        (ontable purple_block)
        (ontable yellow_block)
        (clear orange_block)
        (clear purple_block)
        (clear red_block)
        (handempty robot_1)
    )
    (:goal (and
  (on green_block blue_block)
  (on yellow_block red_block)
  (on red_block purple_block)
  (on purple_block orange_block)
)))
