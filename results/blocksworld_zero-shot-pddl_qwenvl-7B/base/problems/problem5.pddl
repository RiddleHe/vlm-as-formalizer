(define (problem blocksworld-stack)
  (:domain blocksworld)
  (:objects
    y - block
    r - block
    b - block
    o - block
    g - block
    robot - robot
  )
  (:init
    (clear y)
    (clear r)
    (clear b)
    (clear o)
    (clear g)
    (ontable y)
    (ontable r)
    (ontable b)
    (ontable o)
    (ontable g)
    (handempty robot)
  )
  (:goal
    (and
      (on g r)
      (on r b)
      (on b o)
      (on o y)
      (handempty robot)
    )
  )
)