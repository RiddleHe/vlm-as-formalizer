(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow red orange purple green blue - block
    robot1 - robot
  )
  (:init
    ;; left stack (3-high)
    (ontable orange)
    (on red orange)
    (on yellow red)
    (clear yellow)

    ;; middle stack (2-high)
    (ontable green)
    (on purple green)
    (clear purple)

    ;; single block on table
    (ontable blue)
    (clear blue)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on purple green)
      (on yellow red)
      (on orange blue)
    )
  )
)