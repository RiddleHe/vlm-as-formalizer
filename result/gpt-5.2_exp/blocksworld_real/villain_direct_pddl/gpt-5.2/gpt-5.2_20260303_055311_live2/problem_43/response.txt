(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow orange purple red - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; block positions from the image
    (ontable green)
    (ontable blue)
    (ontable yellow)
    (ontable purple)
    (ontable orange)
    (ontable red)

    ;; one stack is already present: orange on purple
    (on orange purple)

    ;; clear conditions
    (clear green)
    (clear blue)
    (clear yellow)
    (clear orange)
    (clear red)
    ;; purple is not clear because orange is on it
  )
  (:goal
    (and
      ;; stack 1: green over orange over blue over yellow
      (on green orange)
      (on orange blue)
      (on blue yellow)

      ;; stack 2: purple over red
      (on purple red)
    )
  )
)