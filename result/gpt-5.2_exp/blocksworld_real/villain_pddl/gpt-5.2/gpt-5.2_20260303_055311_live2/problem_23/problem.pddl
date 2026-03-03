(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green yellow purple red orange - block
    robot1 - robot
  )
  (:init
    ;; block positions from the image
    (ontable yellow)
    (on green yellow)
    (on blue green)
    (ontable red)
    (on purple red)
    (ontable orange)

    ;; clear facts (tops of stacks and single blocks)
    (clear blue)
    (clear purple)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: yellow over blue
      (on yellow blue)

      ;; stack 2: red over orange over green over purple
      (on red orange)
      (on orange green)
      (on green purple)
    )
  )
)