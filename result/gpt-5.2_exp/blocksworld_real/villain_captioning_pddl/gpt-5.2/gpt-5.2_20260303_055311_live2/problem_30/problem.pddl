(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange red yellow purple green blue - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene (top -> bottom):
    (on orange red)
    (on red yellow)
    (on yellow purple)
    (on purple green)
    (on green blue)

    (ontable blue)

    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      ;; goal stack (top -> bottom):
      (on orange purple)
      (on purple green)
      (on green blue)
      (on blue yellow)
      (on yellow red)
      (ontable red)
    )
  )
)