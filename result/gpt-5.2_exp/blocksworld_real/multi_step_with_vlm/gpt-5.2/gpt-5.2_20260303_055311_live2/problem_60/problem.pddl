(define (problem blocksworld)    (:domain blocksworld)    (:objects
        purple_block - block
        yellow_block - block
        blue_block - block
        orange_block - block
        red_block - block
        green_block - block
        robot_1 - robot
    )
    (:init
        (on green_block purple_block)
        (ontable orange_block)
        (ontable red_block)
        (clear red_block)
        (handempty robot_1)
    )
    (:goal (and
  (on red_block green_block)
  (on orange_block blue_block)
  (on blue_block purple_block)
  (on purple_block yellow_block)
)))
