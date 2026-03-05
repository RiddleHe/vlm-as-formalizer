(define (problem put_plunger_in_sink_cabinet)
  (:domain put_task)
  (:objects
    robot - agent

    bathroom_sink_base_cabinet_under_countertop - receptacle

    black_rubber_plunger_beside_toilet - object
    white_toilet_brush_in_holder_beside_toilet - object
    white_toilet - object
    wall_toilet_paper_holder_black - object
    bathroom_countertop_surface - object
    tiled_bathroom_floor - object
    wall_partition_column - object
  )

  (:init
    (openable bathroom_sink_base_cabinet_under_countertop)
  )

  (:goal
    (and
      (inReceptacle black_rubber_plunger_beside_toilet bathroom_sink_base_cabinet_under_countertop)
    )
  )
)