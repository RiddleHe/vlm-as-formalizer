(define (problem blocksworld-two-stacks)
  (:domain blocksworld)
  (:objects
    blue-block pink-block red-block yellow-block orange-block green-block - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear
    (ontable blue-block)   (clear blue-block)
    (ontable pink-block)   (clear pink-block)
    (ontable red-block)    (clear red-block)
    (ontable yellow-block) (clear yellow-block)
    (ontable orange-block) (clear orange-block)
    (ontable green-block)  (clear green-block)

    ;; robot is available and not holding anything
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: blue over pink over red
      (on blue-block pink-block)
      (on pink-block red-block)

      ;; stack 2: yellow over orange over green
      (on yellow-block orange-block)
      (on orange-block green-block)
    )
  )
)