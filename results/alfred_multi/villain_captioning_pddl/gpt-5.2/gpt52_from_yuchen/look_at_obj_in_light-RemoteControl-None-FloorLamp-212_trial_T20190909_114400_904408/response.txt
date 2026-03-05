(define (problem put_task_lamp_remote)
  (:domain put_task)
  (:objects
    robot - agent
    lamp - object
    remotecontrol - object
    sofa - receptacle
  )

  (:init
    ;; receptacles / openness
    (not (openable sofa))
    (not (opened sofa))

    ;; initial locations (robot starts at no location)
    (inReceptacle remotecontrol sofa)
    (inReceptacle lamp sofa)

    ;; initial states
    (not (isOn lamp))
  )

  (:goal
    (and
      (isOn lamp)
      (isToggled lamp)
    )
  )
)