(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    purple-block green-block blue-block red-block orange-block yellow-block - block
    robot-arm - robot
  )
  (:init
    (ontable green-block)
    (on yellow-block green-block)
    (on blue-block yellow-block)
    (on purple-block blue-block)
    (on red-block purple-block)
    (on orange-block red-block)
    (clear orange-block)
    (handempty robot-arm)
  )
  (:goal
    (and
      (on purple-block green-block)
      (on blue-block red-block)
      (on red-block orange-block)
      (on orange-block yellow-block)
    )
  )
)