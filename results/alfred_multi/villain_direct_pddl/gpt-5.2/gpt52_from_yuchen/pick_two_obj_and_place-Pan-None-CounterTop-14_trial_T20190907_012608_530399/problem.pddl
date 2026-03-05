(define (problem put_task_pans_on_counter)
  (:domain put_task)
  (:objects
    robot - agent

    counter - receptacle
    microwave1 - microwave

    pan1 - object
    pan2 - object
    bowl1 - object
  )

  (:init
    ;; receptacle properties
    (openable microwave1)

    ;; object locations (robot starts not at any location)
    (inReceptacle pan1 microwave1)
    (inReceptacle pan2 microwave1)
    (inReceptacle bowl1 microwave1)
  )

  (:goal
    (and
      (inReceptacle pan1 counter)
      (inReceptacle pan2 counter)
    )
  )
)