(define (problem blocksworld)
  (:domain blocksworld)
  (:objects
    pink-block - block
    purple-block - block
    yellow-block - block
    orange-block - block
    robot - robot
  )
  (:init
    (clear pink-block)
    (clear purple-block)
    (clear yellow-block)
    (clear orange-block)
    (ontable pink-block)
    (ontable purple-block)
    (ontable yellow-block)
    (ontable orange-block)
    (handempty robot)
  )
  (:goal
    (and
      (on pink-block purple-block)
      (on yellow-block orange-block)
    )
  )
)