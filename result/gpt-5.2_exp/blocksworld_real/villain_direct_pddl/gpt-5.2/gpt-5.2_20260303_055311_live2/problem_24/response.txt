(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue orange green purple red yellow - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current block configuration inferred from the image
    (ontable orange)
    (ontable green)
    (on blue green)
    (on purple blue)
    (clear purple)

    (ontable red)
    (on yellow red)
    (clear yellow)

    ;; blocks that have something on them are not clear
    (clear orange)
  )
  (:goal
    (and
      (on blue orange)
      (on orange green)
      (on green purple)
      (on purple red)
      (on red yellow)
      (ontable yellow)
      (clear blue)
    )
  )
)