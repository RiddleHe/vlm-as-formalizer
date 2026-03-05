(define (problem put_two_disks_on_bottom_right_shelf)
  (:domain put_task)

  (:objects
    robot - agent
    bottom_right_shelf - receptacle
    disk_1 disk_2 - object
    laptop book - object
  )

  (:init
    ;; robot initial state
    (not (holdsAny robot))

    ;; receptacle info
    ;; bottom_right_shelf is an open cubby (not modeled as openable)

    ;; object locations (both disks are on the desktop, not in any receptacle)
    (atLocation robot disk_1)
    (atLocation robot disk_2)
    (atLocation robot laptop)
    (atLocation robot book)
    (atLocation robot bottom_right_shelf)
  )

  (:goal
    (and
      (inReceptacle disk_1 bottom_right_shelf)
      (inReceptacle disk_2 bottom_right_shelf)
    )
  )
)