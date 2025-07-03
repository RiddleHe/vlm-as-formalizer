(define (problem blocksworld)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    G - block
    B - block
    Y - block
    P - block
    O - block
    R - block
  )
  (:init
    (clear G)
    (clear B)
    (clear Y)
    (clear P)
    (clear O)
    (clear R)
    (ontable G)
    (ontable B)
    (ontable Y)
    (ontable P)
    (ontable O)
    (ontable R)
    (handempty robot1)
  )
  (:goal
    (and
      (on Y O)
      (on R G)
      (on P B)
    )
  )
)