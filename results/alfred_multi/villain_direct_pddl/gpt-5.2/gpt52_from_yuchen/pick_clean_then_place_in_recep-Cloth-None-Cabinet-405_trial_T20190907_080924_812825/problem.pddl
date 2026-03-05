(define (problem put_rinsed_cloth_in_cabinet)
  (:domain put_task)

  (:objects
    robot - agent

    sink1 - sink
    cabinet1 - receptacle

    cloth1 - object
  )

  (:init
    ;; receptacle properties
    (openable cabinet1)

    ;; object locations / containment from the scene
    (inReceptacle cloth1 sink1)

    ;; robot starts not holding anything and not at any location
    ;; (no (holdsAny robot)) implicitly true by closed world assumption
  )

  (:goal
    (and
      (isClean cloth1)
      (inReceptacle cloth1 cabinet1)
    )
  )
)