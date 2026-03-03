(define (problem blocks-scene-stacking)
  (:domain blocksworld)
  (:objects
    blue green yellow red orange purple - block
    robot1 - robot
  )
  (:init
    ;; robot initial state
    (handempty robot1)

    ;; block positions from the scene
    (on green yellow)
    (on blue green)
    (ontable yellow)

    (on purple red)
    (ontable red)

    (ontable orange)

    ;; clear facts
    (clear blue)
    (clear purple)
    (clear orange)
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