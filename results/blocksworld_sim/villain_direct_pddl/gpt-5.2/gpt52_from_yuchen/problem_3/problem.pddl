(define (problem blocksworld_stacks_01)
  (:domain blocksworld)
  (:objects
    yellow green pink red purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table initially
    (ontable yellow)
    (ontable green)
    (ontable pink)
    (ontable red)
    (ontable purple)

    ;; only purple is not clear because red is on it
    (clear yellow)
    (clear green)
    (clear pink)
    (clear red)
    (handempty robot1)

    ;; existing stack in the scene
    (on red purple)
  )
  (:goal
    (and
      (on yellow green)
      (on green pink)
      (on red purple)
    )
  )
)