(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    blue-cube-block green-cube-block red-orange-cube-block
    yellow-rectangular-block orange-rectangular-block purple-rectangular-block
    robot-arm - robot
  )
  (:init
    ;; blocks on table
    (ontable blue-cube-block)
    (ontable green-cube-block)
    (ontable red-orange-cube-block)
    (ontable yellow-rectangular-block)

    ;; existing stack
    (on orange-rectangular-block yellow-rectangular-block)
    (on purple-rectangular-block orange-rectangular-block)

    ;; clear blocks
    (clear blue-cube-block)
    (clear green-cube-block)
    (clear red-orange-cube-block)
    (clear purple-rectangular-block)

    ;; robot state
    (handempty robot-arm)
  )
  (:goal
    (and
      ;; stack 1: yellow over orange over red over purple
      (on yellow-rectangular-block orange-rectangular-block)
      (on orange-rectangular-block red-orange-cube-block)
      (on red-orange-cube-block purple-rectangular-block)

      ;; stack 2: blue over green
      (on blue-cube-block green-cube-block)
    )
  )
)