(define (problem blocks_scene_1)
  (:domain blocksworld)

  (:objects
    red blue purple green yellow orange - block
    robot1 - robot
  )

  (:init
    ;; left stack: red (bottom), blue, purple (top)
    (ontable red)
    (on blue red)
    (on purple blue)

    ;; middle single block
    (ontable green)

    ;; right stack: yellow (bottom), orange (top)
    (ontable yellow)
    (on orange yellow)

    ;; clear conditions
    (clear purple)
    (clear green)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )

  ;; Goal: one stack with order top-to-bottom:
  ;; red over yellow over orange over green over purple over blue
  (:goal
    (and
      (on red yellow)
      (on yellow orange)
      (on orange green)
      (on green purple)
      (on purple blue)
      (ontable blue)
    )
  )
)