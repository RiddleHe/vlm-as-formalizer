(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue-cube-block green-cube-block red-cube-block orange-cube-block yellow-cube-block purple-cube-block - block
    robot-arm - robot
  )
  (:init
    ;; robot state
    (handempty robot-arm)

    ;; table positions
    (ontable blue-cube-block)
    (ontable green-cube-block)
    (ontable red-cube-block)
    (ontable yellow-cube-block)

    ;; stack on the right: yellow (bottom) <- orange <- purple (top)
    (on orange-cube-block yellow-cube-block)
    (on purple-cube-block orange-cube-block)

    ;; clear blocks (no block on top)
    (clear blue-cube-block)
    (clear green-cube-block)
    (clear red-cube-block)
    (clear purple-cube-block)
  )
  (:goal
    (and
      ;; stack 1: yellow over orange over red over purple
      (on yellow-cube-block orange-cube-block)
      (on orange-cube-block red-cube-block)
      (on red-cube-block purple-cube-block)

      ;; stack 2: blue over green
      (on blue-cube-block green-cube-block)
    )
  )
)