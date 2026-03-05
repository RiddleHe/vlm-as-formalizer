(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow green blue purple red orange - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack 1 (center)
    (ontable yellow)
    (on green yellow)
    (on blue green)
    (clear blue)

    ;; stack 2 (right)
    (ontable red)
    (on purple red)
    (clear purple)

    ;; single block (front-left)
    (ontable orange)
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