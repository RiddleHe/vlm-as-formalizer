(define (problem put_task_bathroom_cabinet_tp_rolls)
  (:domain put_task)

  (:objects
    robot - agent

    rectangular-gray-basin-sink-at-right-counter - sink
    wooden-under-sink-cabinet-left-door - receptacle
    wooden-under-sink-cabinet-right-door - receptacle
    black-rectangular-trash-bin-on-floor-corner - receptacle

    toilet-paper-roll-front-on-counter - object
    toilet-paper-roll-back-on-counter - object
    yellow-candle-like-cylinder-on-counter - object
    purple-cleaning-cloth-on-counter - object
    green-spray-bottle-left-on-toilet-tank - object
    green-spray-bottle-right-on-toilet-tank - object
    empty-toilet-paper-cardboard-roll-in-trash-bin - object
  )

  (:init
    (openable wooden-under-sink-cabinet-left-door)
    (openable wooden-under-sink-cabinet-right-door)

    (inReceptacle empty-toilet-paper-cardboard-roll-in-trash-bin black-rectangular-trash-bin-on-floor-corner)
  )

  ;; "second cabinet from the left under the sink" interpreted as the right door cabinet
  (:goal
    (and
      (inReceptacle toilet-paper-roll-front-on-counter wooden-under-sink-cabinet-right-door)
      (inReceptacle empty-toilet-paper-cardboard-roll-in-trash-bin wooden-under-sink-cabinet-right-door)
    )
  )
)