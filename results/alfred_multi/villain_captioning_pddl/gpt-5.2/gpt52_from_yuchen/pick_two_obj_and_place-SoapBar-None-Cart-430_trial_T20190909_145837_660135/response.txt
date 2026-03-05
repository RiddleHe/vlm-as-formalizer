(define (problem bathroom_put_soap_on_steel_rack)
  (:domain put_task)
  (:objects
    robot - agent

    steel_rack - receptacle
    bathroom_sink - sink

    soap1 - object
    soap2 - object

    rack_item_rect - object
    rack_item_cyl - object
  )

  (:init
    ;; Robot starts not at any object's location and holds nothing
    (not (holdsAny robot))

    ;; Receptacles in the scene
    ;; (No openable/opened predicates asserted; rack and sink are not openable in this scene)

    ;; Object placements from the scene
    (inReceptacle soap1 bathroom_sink)
    (inReceptacle rack_item_rect steel_rack)
    (inReceptacle rack_item_cyl steel_rack)

    ;; Second soap is required by the instruction but not clearly visible;
    ;; we leave it not placed in any receptacle so it can be acquired after navigation.
  )

  (:goal
    (and
      (inReceptacle soap1 steel_rack)
      (inReceptacle soap2 steel_rack)
    )
  )
)