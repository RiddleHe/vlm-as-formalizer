(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    blue-block yellow-block purple-block orange-block red-block green-block - block
  )
  (:init
    (handempty robot1)

    (ontable blue-block)
    (clear blue-block)

    (ontable yellow-block)
    (clear yellow-block)

    (ontable purple-block)
    (clear purple-block)

    (ontable orange-block)
    (on red-block orange-block)
    (on green-block red-block)
    (clear green-block)
  )
  (:goal
    (and
      (on orange-block blue-block)
      (on blue-block red-block)
      (on red-block purple-block)
      (ontable purple-block)

      (on yellow-block green-block)
      (ontable green-block)
    )
  )
)