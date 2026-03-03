(define (problem blocksworld-stack-goal1)
  (:domain blocksworld)
  (:objects
    green-top-block - block
    orange-second-block - block
    purple-third-block - block
    red-fourth-block - block
    blue-fifth-block - block
    yellow-bottom-block - block
    robot-arm - robot
  )
  (:init
    (ontable yellow-bottom-block)
    (on blue-fifth-block yellow-bottom-block)
    (on red-fourth-block blue-fifth-block)
    (on purple-third-block red-fourth-block)
    (on orange-second-block purple-third-block)
    (on green-top-block orange-second-block)
    (clear green-top-block)
    (handempty robot-arm)
  )
  (:goal
    (and
      (on red-fourth-block orange-second-block)
      (on orange-second-block yellow-bottom-block)
      (on yellow-bottom-block blue-fifth-block)
      (on blue-fifth-block green-top-block)
      (on green-top-block purple-third-block)
    )
  )
)