(define (problem blocks_scene_stacks_2)
  (:domain blocksworld)

  (:objects
    red purple yellow green orange blue - block
    robot1 - robot
  )

  (:init
    ;; initial stack as seen in the image (bottom to top):
    ;; red, blue, green, purple, yellow, orange
    (ontable red)
    (on blue red)
    (on green blue)
    (on purple green)
    (on yellow purple)
    (on orange yellow)

    (clear orange)
    (handempty robot1)
  )

  (:goal
    (and
      ;; stack 1: red over purple
      (on red purple)

      ;; stack 2: yellow over green over orange over blue
      (on yellow green)
      (on green orange)
      (on orange blue)
    )
  )
)