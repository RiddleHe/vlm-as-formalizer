(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    red green blue purple yellow orange - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; current scene (from image)
    (ontable orange)
    (on blue orange)
    (on yellow blue)
    (on purple yellow)
    (clear purple)

    (ontable red)
    (clear red)

    ;; blocks not explicitly supporting/being supported in the image
    (ontable green)
    (clear green)
  )
  (:goal
    (and
      ;; stack 1: red over green
      (on red green)

      ;; stack 2: orange over blue over purple over yellow
      (on orange blue)
      (on blue purple)
      (on purple yellow)
    )
  )
)