(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue-block red-block orange-block purple-block green-block yellow-block - block
    robot1 - robot
  )
  (:init
    ;; current stack (top -> bottom): blue, red, orange, purple, green, yellow
    (on blue-block red-block)
    (on red-block orange-block)
    (on orange-block purple-block)
    (on purple-block green-block)
    (on green-block yellow-block)

    (ontable yellow-block)

    (clear blue-block)

    (handempty robot1)
  )
  (:goal
    (and
      ;; goal stack: red over blue over green over yellow over orange over purple
      (on red-block blue-block)
      (on blue-block green-block)
      (on green-block yellow-block)
      (on yellow-block orange-block)
      (on orange-block purple-block)
    )
  )
)