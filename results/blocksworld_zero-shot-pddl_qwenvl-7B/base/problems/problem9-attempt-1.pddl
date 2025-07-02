(define (problem blocksworld_stack)
  (:domain blocksworld)
  (:objects
    orange - block
    red - block
    yellow - block
    green - block
    blue - block
    purple - block
  )
  (:init
    (clear orange)
    (ontable orange)
    (clear red)
    (ontable red)
    (clear yellow)
    (ontable yellow)
    (clear green)
    (ontable green)
    (clear blue)
    (ontable blue)
    (clear purple)
    (ontable purple)
    (handempty robot)
  )
  (:goal
    (and
      (on purple blue)
      (on blue green)
      (on green yellow)
      (on yellow red)
      (on red orange)
      (handempty robot)
    )
  )
)