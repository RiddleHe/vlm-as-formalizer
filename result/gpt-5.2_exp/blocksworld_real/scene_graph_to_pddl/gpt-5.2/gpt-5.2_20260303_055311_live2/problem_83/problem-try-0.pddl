(define (problem blocksworld-stacks-1)
  (:domain blocksworld)
  (:objects
    purple-bottom-block
    red-above-purple-block
    yellow-above-red-block
    blue-above-yellow-block
    green-top-block
    orange-single-block
    robot-arm - robot
  )

  (:init
    (ontable purple-bottom-block)
    (ontable orange-single-block)

    (on red-above-purple-block purple-bottom-block)
    (on yellow-above-red-block red-above-purple-block)
    (on blue-above-yellow-block yellow-above-red-block)
    (on green-top-block blue-above-yellow-block)

    (clear green-top-block)
    (clear orange-single-block)

    (handempty robot-arm)
  )

  (:goal
    (and
      (on purple-bottom-block red-above-purple-block)
      (on red-above-purple-block blue-above-yellow-block)
      (on blue-above-yellow-block orange-single-block)
      (on orange-single-block yellow-above-red-block)
      (on yellow-above-red-block green-top-block)
    )
  )
)