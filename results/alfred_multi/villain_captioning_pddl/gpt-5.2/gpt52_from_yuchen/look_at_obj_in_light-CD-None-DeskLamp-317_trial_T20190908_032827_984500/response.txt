(define (problem inspect-cd-by-lamp)
  (:domain put_task)
  (:objects
    robot - agent
    lamp - object
    cd - object
    dresser - receptacle
    nightstand - receptacle
  )
  (:init
    ;; receptacles in the scene
    (inReceptacle lamp nightstand)
    (inReceptacle cd dresser)

    ;; initial robot state (not at any object's location)
    (not (holdsAny robot))
  )
  (:goal
    (and
      ;; have the lamp on so it provides light
      (isOn lamp)
      (isToggled lamp)

      ;; cd is at the lamp location (to be inspected by lamp light)
      (atLocation robot lamp)
      (inReceptacle cd nightstand)
    )
  )
)