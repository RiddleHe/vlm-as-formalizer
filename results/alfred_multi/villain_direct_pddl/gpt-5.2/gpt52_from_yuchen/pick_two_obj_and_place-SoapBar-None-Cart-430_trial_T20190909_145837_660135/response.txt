(define (problem put_two_soaps_on_steel_rack)
  (:domain put_task)
  (:objects
    robot - agent

    steel_rack - receptacle
    sink_basin - sink

    soap1 - object
    soap2 - object
  )

  (:init
    ;; receptacles
    (openable steel_rack) ; treated as a receptacle (rack that can hold items)
    ;; note: sink is a receptacle type but not necessarily openable

    ;; object locations (robot starts at no location)
    (inReceptacle soap1 sink_basin)
    (inReceptacle soap2 sink_basin)
  )

  (:goal
    (and
      (inReceptacle soap1 steel_rack)
      (inReceptacle soap2 steel_rack)
    )
  )
)