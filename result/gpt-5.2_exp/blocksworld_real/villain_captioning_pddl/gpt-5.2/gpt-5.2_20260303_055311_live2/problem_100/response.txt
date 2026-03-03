(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    red-block yellow-block orange-block green-block purple-block blue-block - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear
    (ontable red-block)
    (ontable yellow-block)
    (ontable orange-block)
    (ontable green-block)
    (ontable purple-block)
    (ontable blue-block)

    (clear red-block)
    (clear yellow-block)
    (clear orange-block)
    (clear green-block)
    (clear purple-block)
    (clear blue-block)

    ;; robot is available and not holding anything
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over yellow over blue
      (on red-block yellow-block)
      (on yellow-block blue-block)

      ;; stack 2: green over orange over purple
      (on green-block orange-block)
      (on orange-block purple-block)
    )
  )
)