(define (problem look-at-box-by-lamp)
  (:domain put_task)

  (:objects
    robot - agent

    box - receptacle
    lamp - object
    phone - object
    clock - object
    cup - object
    pen1 - object
    pen2 - object
    keys - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts true)

    ;; No object is being held initially
    ;; (holdsAny robot) is false by absence

    ;; Box is a receptacle; assume it is openable and currently opened (flaps open)
    (openable box)
    (opened box)

    ;; Objects are not in any receptacle (none observed inside box)

    ;; Lamp state not visually confirmable; leave (isOn lamp) unspecified
  )

  (:goal
    (and
      ;; "Look at a box by the light of a lamp" approximated in this domain as:
      ;; be at the box location and have the lamp turned on (toggled on).
      (atLocation robot box)
      (isOn lamp)
      (isToggled lamp)
    )
  )
)