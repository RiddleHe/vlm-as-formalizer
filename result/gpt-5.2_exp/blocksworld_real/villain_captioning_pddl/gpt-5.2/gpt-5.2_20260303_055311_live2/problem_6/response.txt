(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue_block purple_block red_block yellow_block orange_block - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack in the scene
    (on blue_block purple_block)

    ;; table placements
    (ontable purple_block)
    (ontable red_block)
    (ontable yellow_block)
    (ontable orange_block)

    ;; clear facts
    (clear blue_block)
    (clear red_block)
    (clear yellow_block)
    (clear orange_block)
    ;; purple_block is not clear because blue_block is on it
  )
  (:goal
    (and
      (on blue_block orange_block)
      (on orange_block red_block)
      (on red_block purple_block)
      ;; Note: the instruction requires a green block, but none is present in the scene objects.
      ;; Therefore the full requested stack cannot be expressed/achieved with the provided scene.
      (on purple_block yellow_block)
    )
  )
)