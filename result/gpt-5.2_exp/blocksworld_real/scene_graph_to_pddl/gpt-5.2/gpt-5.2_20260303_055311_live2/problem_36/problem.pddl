(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    green-block purple-block yellow-block orange-block red-block blue-block - block
    robot-arm - robot
  )
  (:init
    ;; on-table blocks
    (ontable green-block)
    (ontable purple-block)
    (ontable yellow-block)
    (ontable red-block)

    ;; stacked relations
    (on orange-block yellow-block)
    (on blue-block red-block)

    ;; clear blocks
    (clear green-block)
    (clear purple-block)
    (clear orange-block)
    (clear blue-block)

    ;; robot state
    (handempty robot-arm)
  )
  (:goal
    (and
      (on red-block yellow-block)
      (on yellow-block blue-block)
      (on orange-block green-block)
      (on green-block purple-block)
    )
  )
)