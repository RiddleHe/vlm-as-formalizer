(define (problem color_stack)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    red_block - block
    green_block - block
    yellow_block - block
    purple_block - block
    blue_block - block
    orange_block - block
  )
  (:init
    (handempty robot1)
    (ontable red_block)
    (clear red_block)
    (ontable green_block)
    (clear green_block)
    (on green_block blue_block)
    (clear blue_block)
    (on blue_block orange_block)
    (clear orange_block)
    (ontable yellow_block)
    (clear yellow_block)
    (ontable purple_block)
    (clear purple_block)
  )
  (:goal
    (and
      (on orange_block yellow_block)
      (on yellow_block green_block)
      (on green_block purple_block)
      (on purple_block red_block)
    )
  )
)