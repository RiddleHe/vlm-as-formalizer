(define (problem blocksworld_scene1_restack)
  (:domain blocksworld)
  (:objects
    orange-block red-block yellow-block purple-block green-block blue-block - block
    robot1 - robot
  )
  (:init
    ;; current tower (top to bottom): orange, red, yellow, purple, green, blue
    (on orange-block red-block)
    (on red-block yellow-block)
    (on yellow-block purple-block)
    (on purple-block green-block)
    (on green-block blue-block)
    (ontable blue-block)

    ;; clear status
    (clear orange-block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; required single stack: orange over purple over green over blue over yellow over red
      (on orange-block purple-block)
      (on purple-block green-block)
      (on green-block blue-block)
      (on blue-block yellow-block)
      (on yellow-block red-block)
      (ontable red-block)
    )
  )
)