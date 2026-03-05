(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow-block orange-block red-block green-block purple-block blue-block - block
    robot1 - robot
  )
  (:init
    ;; left stack
    (on yellow-block orange-block)
    (ontable orange-block)
    (clear yellow-block)

    ;; right stack
    (on red-block green-block)
    (on green-block purple-block)
    (ontable purple-block)
    (clear red-block)

    ;; single block
    (ontable blue-block)
    (clear blue-block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow-block green-block)
      (on green-block purple-block)
      (on purple-block red-block)
      (on red-block blue-block)
      (on blue-block orange-block)
      (ontable orange-block)
      (clear yellow-block)
    )
  )
)