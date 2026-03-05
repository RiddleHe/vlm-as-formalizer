(define (problem bedroom_pencil_under_lamp)
  (:domain put_task)

  (:objects
    robot - agent

    nightstand - receptacle
    pencil - object
    lamp - object
    knife1 - knife
  )

  (:init
    ;; receptacles
    ;; nightstand is a surface that can hold objects
    (inReceptacle pencil nightstand)
    (inReceptacle knife1 nightstand)
    (inReceptacle lamp nightstand)

    ;; robot starts not at any object's location and holds nothing
    ;; (no atLocation facts)
  )

  (:goal
    (and
      ;; get the pencil
      (holds robot pencil)
      ;; "look at it under the lamp" approximated as being at the lamp location while holding pencil
      (atLocation robot lamp)
    )
  )
)