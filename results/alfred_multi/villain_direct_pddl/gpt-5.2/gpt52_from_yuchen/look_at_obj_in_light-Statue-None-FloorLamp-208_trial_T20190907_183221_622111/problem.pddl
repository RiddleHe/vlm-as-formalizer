(define (problem put_task_trophy_lamp)
  (:domain put_task)
  (:objects
    robot - agent
    trophy - object
    lamp - object
    table - receptacle
  )

  (:init
    ;; robot starts not at any location (no atLocation facts)

    ;; scene layout: trophy and lamp are on the table
    (inReceptacle trophy table)
    (inReceptacle lamp table)
  )

  (:goal
    (and
      ;; interpret "examine a trophy with a lamp" as bringing the lamp to the trophy
      ;; by being at the trophy's location and holding the lamp
      (atLocation robot trophy)
      (holds robot lamp)
    )
  )
)