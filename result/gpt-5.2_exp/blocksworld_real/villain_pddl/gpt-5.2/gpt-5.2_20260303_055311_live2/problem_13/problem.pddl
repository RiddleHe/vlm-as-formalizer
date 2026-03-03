(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue - block
    yellow - block
    purple - block
    green - block
    red - block
    orange - block
    robot1 - robot
  )
  (:init
    ;; assume a robot arm is available and initially empty
    (handempty robot1)

    ;; stack 1 (front/right): blue on purple on yellow
    (on blue purple)
    (on purple yellow)
    (ontable yellow)
    (clear blue)

    ;; stack 2 (back/left): green on red on orange
    (on green red)
    (on red orange)
    (ontable orange)
    (clear green)
  )
  (:goal
    (and
      ;; stack A: blue over yellow
      (on blue yellow)
      (ontable yellow)

      ;; stack B: orange over red over purple over green
      (on orange red)
      (on red purple)
      (on purple green)
      (ontable green)
    )
  )
)