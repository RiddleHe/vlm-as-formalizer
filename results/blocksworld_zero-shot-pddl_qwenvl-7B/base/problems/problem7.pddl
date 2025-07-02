(define (problem blocksworld-stack)
  (:domain blocksworld)
  (:objects
    yellow-block - block
    pink-block - block
    green-block - block
    red-block - block
    purple-block - block
    blue-block - block
    robot - robot
  )
  (:init
    (clear yellow-block)
    (clear pink-block)
    (clear green-block)
    (clear red-block)
    (clear purple-block)
    (clear blue-block)
    (ontable yellow-block)
    (ontable pink-block)
    (ontable green-block)
    (ontable red-block)
    (ontable purple-block)
    (ontable blue-block)
    (handempty robot)
  )
  (:goal (and
          (on yellow-block pink-block)
          (on pink-block green-block)
          (on green-block red-block)
          (on red-block purple-block)
          (on purple-block blue-block)
          (handempty robot)
        )
  )
)