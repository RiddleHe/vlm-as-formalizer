(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    blue-bottom-block yellow-middle-block red-upper-block green-top-block
    orange-bottom-block purple-top-block
    robot-arm - robot
  )
  (:init
    ;; table placements
    (ontable blue-bottom-block)
    (ontable orange-bottom-block)

    ;; existing stacks
    (on yellow-middle-block blue-bottom-block)
    (on red-upper-block yellow-middle-block)
    (on green-top-block red-upper-block)
    (on purple-top-block orange-bottom-block)

    ;; clear blocks
    (clear green-top-block)
    (clear purple-top-block)

    ;; robot state
    (handempty robot-arm)
  )
  (:goal
    (and
      ;; Stack 1: orange over green
      (on orange-bottom-block green-top-block)

      ;; Stack 2: red over blue over purple over yellow
      (on red-upper-block blue-bottom-block)
      (on blue-bottom-block purple-top-block)
      (on purple-top-block yellow-middle-block)
    )
  )
)