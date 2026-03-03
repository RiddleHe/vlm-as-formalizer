(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow blue green purple red orange - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack 1: blue on green on yellow (yellow on table)
    (on blue green)
    (on green yellow)
    (ontable yellow)

    ;; stack 2: purple on red (red on table)
    (on purple red)
    (ontable red)

    ;; single block
    (ontable orange)

    ;; clear blocks
    (clear blue)
    (clear purple)
    (clear orange)
  )
  (:goal
    (and
      ;; stack A: yellow over blue
      (on yellow blue)

      ;; stack B: red over orange over green over purple
      (on red orange)
      (on orange green)
      (on green purple)
    )
  )
)