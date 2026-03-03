(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red orange yellow green blue purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; observed stacks / placements from the image
    (on purple orange)
    (ontable orange)
    (clear purple)

    (ontable green)
    (clear green)

    (on yellow orange) ;; note: right stack shows yellow on orange on blue; represent as such
    (on orange blue)
    (ontable blue)
    (clear yellow)

    (ontable red)
    (clear red)
  )
  (:goal
    (and
      (on green purple)
      (on purple orange)
      (on orange yellow)
      (on yellow blue)
      (on blue red)
      (ontable red)
      (clear green)
    )
  )
)