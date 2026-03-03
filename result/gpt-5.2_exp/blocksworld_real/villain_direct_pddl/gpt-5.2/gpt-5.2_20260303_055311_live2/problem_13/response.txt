(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue purple yellow green red orange - block
    robot1 - robot
  )
  (:init
    ;; stack 1 (front/right): blue on purple on yellow (yellow on table)
    (on blue purple)
    (on purple yellow)
    (ontable yellow)
    (clear blue)

    ;; stack 2 (back/left): green on red on orange (orange on table)
    (on green red)
    (on red orange)
    (ontable orange)
    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      ;; stack A: blue over yellow
      (on blue yellow)

      ;; stack B: orange over red over purple over green
      (on orange red)
      (on red purple)
      (on purple green)
    )
  )
)