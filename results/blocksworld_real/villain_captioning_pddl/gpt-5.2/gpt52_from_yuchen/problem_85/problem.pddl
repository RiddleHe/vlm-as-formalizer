(define (problem blocksworld-color-stack-1)
  (:domain blocksworld)
  (:objects
    green_block orange_block purple_block red_block blue_block yellow_block - block
    robot1 - robot
  )
  (:init
    ;; tower configuration (bottom -> top)
    (ontable yellow_block)
    (on blue_block yellow_block)
    (on red_block blue_block)
    (on purple_block red_block)
    (on orange_block purple_block)
    (on green_block orange_block)

    ;; clear statuses
    (clear green_block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; requested stack: red over orange over yellow over blue over green over purple
      (on red_block orange_block)
      (on orange_block yellow_block)
      (on yellow_block blue_block)
      (on blue_block green_block)
      (on green_block purple_block)
      (ontable purple_block)
    )
  )
)