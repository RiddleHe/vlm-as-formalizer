(define (problem put_task_desk_1)
  (:domain put_task)
  (:objects
    robot - agent
    lamp - object
    tissuebox1 tissuebox2 - receptacle
    pencil - object
    pen - object
    clock - object
    keys - object
  )
  (:init
    ;; receptacle properties
    (openable tissuebox1)
    (openable tissuebox2)

    ;; contents / spatial relations
    (inReceptacle keys tissuebox2)

    ;; robot starts not at any location (so no atLocation facts for robot)
  )
  (:goal
    (and
      (isOn lamp)
      (holds robot tissuebox1)
    )
  )
)