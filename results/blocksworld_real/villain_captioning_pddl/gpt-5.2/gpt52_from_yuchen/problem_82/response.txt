(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue-block yellow-block red-block orange-block green-block purple-block - block
    robot1 - robot
  )
  (:init
    ;; tower (bottom -> top): green, orange, red, yellow, blue
    (ontable green-block)
    (on orange-block green-block)
    (on red-block orange-block)
    (on yellow-block red-block)
    (on blue-block yellow-block)

    ;; separate block
    (ontable purple-block)

    ;; clear blocks
    (clear blue-block)
    (clear purple-block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over blue
      (on red-block blue-block)

      ;; stack 2: yellow over green over orange over purple
      (on yellow-block green-block)
      (on green-block orange-block)
      (on orange-block purple-block)
    )
  )
)