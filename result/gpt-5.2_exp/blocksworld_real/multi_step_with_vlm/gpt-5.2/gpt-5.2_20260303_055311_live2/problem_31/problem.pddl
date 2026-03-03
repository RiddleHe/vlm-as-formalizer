(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        red_block - block
        yellow_block - block
        purple_block - block
        green_block - block
        blue_block - block
        robot_1 - robot
    )
    (:init
        (on orange_block yellow_block)
        (on red_block yellow_block)
        (ontable yellow_block)
        (ontable purple_block)
        (ontable green_block)
        (ontable blue_block)
        (clear orange_block)
        (clear purple_block)
        (clear green_block)
        (clear blue_block)
        (handempty robot_1)
    )
    (:goal (and 
    (on red_block purple_block)
    (on purple_block yellow_block)
    (on orange_block blue_block)
    (on blue_block green_block)
  )
))
