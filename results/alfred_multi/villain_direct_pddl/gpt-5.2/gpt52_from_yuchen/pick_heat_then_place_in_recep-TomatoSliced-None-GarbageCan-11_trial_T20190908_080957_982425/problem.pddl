(define (problem put_task_tomato_slice_to_trash)
  (:domain put_task)
  (:objects
    robot - agent

    counter - receptacle
    trashcan - receptacle

    knife1 - knife
    tomato1 - object
  )

  (:init
    ;; receptacles
    (inReceptacle tomato1 counter)
    (inReceptacle knife1 counter)

    ;; robot initially not at any object's location (so no atLocation facts for robot)
  )

  (:goal
    (and
      (isSliced tomato1)
      (inReceptacle tomato1 trashcan)
    )
  )
)