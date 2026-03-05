(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    purple-block orange-block blue-block red-block yellow-block green-block - block
    robot1 - robot
  )
  (:init
    ;; existing stack on the right: purple on orange on blue (blue on table)
    (on purple-block orange-block)
    (on orange-block blue-block)
    (ontable blue-block)

    ;; single blocks on the table
    (ontable yellow-block)
    (ontable red-block)
    (ontable green-block)

    ;; clear conditions
    (clear purple-block)
    (clear yellow-block)
    (clear red-block)
    (clear green-block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: green over blue over purple
      (on green-block blue-block)
      (on blue-block purple-block)

      ;; stack 2: yellow over orange over red
      (on yellow-block orange-block)
      (on orange-block red-block)
    )
  )
)