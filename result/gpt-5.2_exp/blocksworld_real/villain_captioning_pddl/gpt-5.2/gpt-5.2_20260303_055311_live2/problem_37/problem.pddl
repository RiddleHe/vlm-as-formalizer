(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green-block yellow-block blue-block orange-block purple-block red-block - block
    robot1 - robot
  )
  (:init
    (on green-block yellow-block)
    (on yellow-block blue-block)
    (on blue-block orange-block)
    (on orange-block purple-block)
    (on purple-block red-block)
    (ontable red-block)

    (clear green-block)

    (handempty robot1)
  )
  (:goal
    (and
      (on green-block blue-block)
      (on blue-block yellow-block)
      (on yellow-block purple-block)
      (on purple-block orange-block)
      (on orange-block red-block)
      (ontable red-block)
    )
  )
)