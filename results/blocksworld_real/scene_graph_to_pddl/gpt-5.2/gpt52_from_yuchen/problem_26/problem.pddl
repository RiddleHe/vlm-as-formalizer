(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    purple-bottom-block blue-block green-block yellow-block red-block orange-top-block - block
    robot-arm - robot
  )
  (:init
    (ontable purple-bottom-block)
    (on blue-block purple-bottom-block)
    (on green-block blue-block)
    (on yellow-block green-block)
    (on red-block yellow-block)
    (on orange-top-block red-block)
    (clear orange-top-block)
    (handempty robot-arm)
  )
  (:goal
    (and
      (on green-block blue-block)
      (on purple-bottom-block orange-top-block)
      (on red-block yellow-block)
    )
  )
)