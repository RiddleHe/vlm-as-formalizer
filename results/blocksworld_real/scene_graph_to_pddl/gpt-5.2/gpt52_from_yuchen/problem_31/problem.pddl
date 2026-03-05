(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    purple-cube-block green-cube-block blue-cube-block yellow-cube-block red-cube-block orange-cube-block - block
    assumed-robot-arm - robot
  )
  (:init
    ;; blocks on table
    (ontable purple-cube-block)
    (ontable green-cube-block)
    (ontable blue-cube-block)
    (ontable yellow-cube-block)

    ;; stacked blocks
    (on red-cube-block yellow-cube-block)
    (on orange-cube-block red-cube-block)

    ;; clear blocks
    (clear purple-cube-block)
    (clear green-cube-block)
    (clear blue-cube-block)
    (clear orange-cube-block)

    ;; robot state
    (handempty assumed-robot-arm)
  )
  (:goal
    (and
      (on red-cube-block purple-cube-block)
      (on purple-cube-block yellow-cube-block)
      (on orange-cube-block blue-cube-block)
      (on blue-cube-block green-cube-block)
    )
  )
)