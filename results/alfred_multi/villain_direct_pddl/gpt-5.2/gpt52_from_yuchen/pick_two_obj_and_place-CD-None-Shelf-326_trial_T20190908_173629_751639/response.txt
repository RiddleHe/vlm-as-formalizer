(define (problem put_task_disks_to_shelf)
  (:domain put_task)

  (:objects
    robot - agent

    disk1 disk2 book laptop - object
    desk_shelf_bottom_right - receptacle
  )

  (:init
    ;; receptacle properties
    (atLocation robot desk_shelf_bottom_right)

    ;; objects initially on the desk surface (not in any receptacle)
    (atLocation robot disk1)
    (atLocation robot disk2)
    (atLocation robot book)
    (atLocation robot laptop)
  )

  (:goal
    (and
      (inReceptacle disk1 desk_shelf_bottom_right)
      (inReceptacle disk2 desk_shelf_bottom_right)
    )
  )
)