(define (problem blocks-stacks-2)
  (:domain blocksworld)
  (:objects
    orange red purple yellow green blue - block
    robot1 - robot
  )
  (:init
    ;; initial tower (top to bottom): orange, red, purple, yellow, green, blue
    (on orange red)
    (on red purple)
    (on purple yellow)
    (on yellow green)
    (on green blue)
    (ontable blue)

    (clear orange)
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over green over purple
      (on red green)
      (on green purple)

      ;; stack 2: orange over blue over yellow
      (on orange blue)
      (on blue yellow)
    )
  )
)