(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red green orange yellow blue purple - block
    robot1 - robot
  )
  (:init
    ;; stack A
    (ontable green)
    (on red green)
    (clear red)

    ;; stack B
    (ontable orange)
    (on yellow orange)
    (clear yellow)

    ;; single blocks
    (ontable blue)
    (clear blue)
    (ontable purple)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green orange)
      (on orange purple)
      (on purple blue)
      (on yellow red)
    )
  )
)