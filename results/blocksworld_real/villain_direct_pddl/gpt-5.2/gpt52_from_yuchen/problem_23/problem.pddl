(define (problem blocks_scene)
  (:domain blocksworld)
  (:objects
    blue green yellow red orange purple - block
    robot1 - robot
  )

  (:init
    ;; Robot state
    (handempty robot1)

    ;; Block positions from the scene
    (on blue green)
    (on green yellow)
    (ontable yellow)

    (on purple red)
    (ontable red)

    (ontable orange)

    ;; Clear blocks
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