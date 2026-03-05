(define (problem blocksworld_stacks3)
  (:domain blocksworld)
  (:objects
    blue-block orange-block yellow-block green-block red-block purple-block - block
    robot1 - robot
  )
  (:init
    ;; left stack
    (on blue-block orange-block)
    (ontable orange-block)
    (clear blue-block)

    ;; middle stack
    (on yellow-block green-block)
    (ontable green-block)
    (clear yellow-block)

    ;; right stack
    (on red-block purple-block)
    (ontable purple-block)
    (clear red-block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange-block yellow-block)
      (on green-block blue-block)
      (on purple-block red-block)
    )
  )
)