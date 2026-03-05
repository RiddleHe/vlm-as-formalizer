(define (problem blocks_scene_stack1)
  (:domain blocksworld)
  (:objects
    yellow-block blue-block purple-block
    green-block red-block orange-block - block
    robot1 - robot
  )
  (:init
    ;; left stack
    (ontable yellow-block)
    (on blue-block yellow-block)
    (on purple-block blue-block)

    ;; right stack
    (ontable green-block)
    (on red-block green-block)
    (on orange-block red-block)

    ;; clear blocks (tops of stacks)
    (clear purple-block)
    (clear orange-block)

    ;; robot hand state
    (handempty robot1)
  )
  (:goal
    (and
      (ontable orange-block)
      (on green-block orange-block)
      (on red-block green-block)
      (on purple-block red-block)
      (on blue-block purple-block)
      (on yellow-block blue-block)
    )
  )
)