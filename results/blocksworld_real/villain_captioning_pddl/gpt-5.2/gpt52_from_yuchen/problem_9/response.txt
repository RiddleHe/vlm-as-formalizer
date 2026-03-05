(define (problem blocksworld_scene_3stacks)
  (:domain blocksworld)
  (:objects
    orange-block purple-block red-block green-block yellow-block blue-block - block
    robot1 - robot
  )
  (:init
    ;; left stack: red on purple on orange (orange on table)
    (ontable orange-block)
    (on purple-block orange-block)
    (on red-block purple-block)
    (clear red-block)

    ;; right stack: blue on yellow on green (green on table)
    (ontable green-block)
    (on yellow-block green-block)
    (on blue-block yellow-block)
    (clear blue-block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange-block blue-block)
      (on red-block green-block)
      (on yellow-block purple-block)
    )
  )
)