(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow red orange purple green blue - block
    robot1 - robot
  )
  (:init
    ;; stacks seen in the image
    (on yellow red)
    (on red orange)
    (ontable orange)
    (clear yellow)

    (on purple green)
    (ontable green)
    (clear purple)

    ;; single block on the table
    (ontable blue)
    (clear blue)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Create 3 stacks: purple over green, yellow over red, orange over blue
      (on purple green)
      (on yellow red)
      (on orange blue)
    )
  )
)