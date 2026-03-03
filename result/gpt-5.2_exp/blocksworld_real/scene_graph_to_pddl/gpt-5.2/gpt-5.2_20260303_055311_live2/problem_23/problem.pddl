(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    blue-cube-block green-cube-block yellow-cube-block purple-cube-block red-cube-block orange-cube-block - block
    robot-arm - robot
  )
  (:init
    ;; on-table blocks
    (ontable orange-cube-block)
    (ontable yellow-cube-block)
    (ontable red-cube-block)

    ;; stacks in the scene
    (on green-cube-block yellow-cube-block)
    (on blue-cube-block green-cube-block)
    (on purple-cube-block red-cube-block)

    ;; clear blocks
    (clear blue-cube-block)
    (clear purple-cube-block)
    (clear orange-cube-block)

    ;; robot state
    (handempty robot-arm)
  )
  (:goal
    (and
      (on yellow-cube-block blue-cube-block)
      (on red-cube-block orange-cube-block)
      (on orange-cube-block green-cube-block)
      (on green-cube-block purple-cube-block)
    )
  )
)