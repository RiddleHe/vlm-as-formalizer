(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    purple-block blue-block red-block orange-block yellow-block green-block - block
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack: blue on yellow
    (on blue-block yellow-block)
    (ontable yellow-block)
    (clear blue-block)

    ;; Stack: red on orange
    (on red-block orange-block)
    (ontable orange-block)
    (clear red-block)

    ;; Single blocks on table
    (ontable purple-block)
    (clear purple-block)

    (ontable green-block)
    (clear green-block)
  )
  (:goal
    (and
      (on purple-block blue-block)
      (on red-block orange-block)
      (on yellow-block green-block)
    )
  )
)