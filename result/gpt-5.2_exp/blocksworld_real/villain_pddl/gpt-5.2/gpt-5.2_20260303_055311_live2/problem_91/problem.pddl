(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green yellow red purple orange - block
    robot1 - robot
  )
  (:init
    ;; stacks and placements inferred from the images:
    (on green blue)
    (on yellow orange)

    (ontable blue)
    (ontable purple)
    (ontable orange)
    (ontable red)

    (clear green)
    (clear yellow)
    (clear purple)
    (clear red)

    (handempty robot1)
  )
  (:goal
    (and
      (on orange purple)
      (on purple red)
      (on red yellow)
      (on yellow green)
      (on green blue)
    )
  )
)