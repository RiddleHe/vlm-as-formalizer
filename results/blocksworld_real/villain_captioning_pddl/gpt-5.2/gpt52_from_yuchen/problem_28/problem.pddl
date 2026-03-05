(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange-block yellow-block green-block purple-block red-block blue-block - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack on the left: green on blue on orange (orange on table)
    (ontable orange-block)
    (on blue-block orange-block)
    (on green-block blue-block)
    (clear green-block)

    ;; Other blocks on the table
    (ontable yellow-block)
    (clear yellow-block)

    (ontable red-block)
    (clear red-block)

    (ontable purple-block)
    (clear purple-block)
  )
  (:goal
    (and
      ;; Create 1 stack: orange over yellow over green over purple over red over blue
      (on orange-block yellow-block)
      (on yellow-block green-block)
      (on green-block purple-block)
      (on purple-block red-block)
      (on red-block blue-block)
      (ontable blue-block)
    )
  )
)