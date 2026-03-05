(define (problem bathroom_put_two_sprays_on_rack)
  (:domain put_task)

  (:objects
    robot - agent
    metal_rack - receptacle
    blue_bin - receptacle
    yellow_spray_bottle small_spray_bottle - object
  )

  (:init
    ;; agent starts not at any location; no (atLocation robot ...) facts initially

    ;; receptacles
    ;; metal_rack and blue_bin are not openable in this scene (no openable/opened facts)

    ;; object locations (both spray bottles are already on/in the metal rack)
    (inReceptacle yellow_spray_bottle metal_rack)
    (inReceptacle small_spray_bottle metal_rack)
  )

  (:goal
    (and
      (inReceptacle yellow_spray_bottle metal_rack)
      (inReceptacle small_spray_bottle metal_rack)
    )
  )
)