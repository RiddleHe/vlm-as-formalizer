(define (problem blocksworld)
  (:domain blocksworld)
  (:objects
    yellow green pink red purple
  )
  (:init
    (clear yellow)
    (clear green)
    (clear pink)
    (clear red)
    (clear purple)
    (ontable yellow)
    (ontable green)
    (ontable pink)
    (ontable red)
    (ontable purple)
    (handempty robot)
  )
  (:goal
    (and
      (on yellow green)
      (on green pink)
      (on red purple)
    )
  )
)