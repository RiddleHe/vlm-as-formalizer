(define (problem blocksworld-stacks-1)
  (:domain blocksworld)
  (:objects
    purple-block orange-block blue-block red-block yellow-block green-block - block
    robot-arm - robot
  )
  (:init
    ;; block positions
    (ontable blue-block)
    (ontable yellow-block)
    (ontable green-block)

    (on purple-block orange-block)
    (on orange-block blue-block)
    (on red-block yellow-block)

    ;; clear blocks
    (clear purple-block)
    (clear red-block)
    (clear green-block)

    ;; robot state
    (handempty robot-arm)
  )
  (:goal
    (and
      (on green-block red-block)
      (on red-block orange-block)
      (on orange-block purple-block)
      (on purple-block blue-block)
      (on blue-block yellow-block)
    )
  )
)