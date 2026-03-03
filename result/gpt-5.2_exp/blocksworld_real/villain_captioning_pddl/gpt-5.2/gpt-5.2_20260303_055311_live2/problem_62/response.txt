(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue-block yellow-block orange-block green-block red-block purple-block - block
    robot1 - robot
  )
  (:init
    ;; left stack
    (ontable green-block)
    (on orange-block green-block)
    (clear orange-block)

    ;; middle stack
    (ontable purple-block)
    (on blue-block purple-block)
    (clear blue-block)

    ;; right stack
    (ontable yellow-block)
    (on red-block yellow-block)
    (clear red-block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on blue-block yellow-block)
      (on yellow-block orange-block)
      (on green-block red-block)
      (on red-block purple-block)
    )
  )
)