(define (problem blocksworld)
  (:domain blocksworld)
  (:objects
    blue-block pink-block red-block yellow-block orange-block green-block
  )
  (:init
    (clear blue-block)
    (clear pink-block)
    (clear red-block)
    (clear yellow-block)
    (clear orange-block)
    (clear green-block)
    (ontable blue-block)
    (ontable pink-block)
    (ontable red-block)
    (ontable yellow-block)
    (ontable orange-block)
    (ontable green-block)
  )
  (:goal
    (and
      (on blue-block pink-block)
      (on pink-block red-block)
      (on yellow-block orange-block)
      (on orange-block green-block)
    )
  )
)