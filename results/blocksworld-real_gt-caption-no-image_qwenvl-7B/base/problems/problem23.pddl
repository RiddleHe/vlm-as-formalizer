(define (problem blocksworld)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    P1 - block
    R1 - block
    B1 - block
    G1 - block
    Y1 - block
    O1 - block
  )
  (:init
    (clear P1)
    (clear R1)
    (clear B1)
    (clear G1)
    (clear Y1)
    (clear O1)
    (ontable P1)
    (ontable R1)
    (ontable B1)
    (ontable G1)
    (ontable Y1)
    (ontable O1)
    (handempty robot1)
  )
  (:goal
    (and
      (on Y1 B1)
      (on R1 O1)
      (on O1 G1)
      (on G1 P1)
    )
  )
)