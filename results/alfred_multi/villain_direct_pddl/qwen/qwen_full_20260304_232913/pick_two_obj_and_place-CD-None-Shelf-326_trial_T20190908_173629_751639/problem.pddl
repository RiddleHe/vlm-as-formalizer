(define (problem move_disks_to_shelf)
    (:domain put_task)
    (:objects
        robot - agent
        disk1 disk2 - object
        desk - receptacle
        shelf - receptacle
    )
    (:init
        (atLocation robot desk)
        (inReceptacle disk1 desk)
        (inReceptacle disk2 desk)
        (openable shelf)
        (not (opened shelf))
    )
    (:goal
        (and
            (inReceptacle disk1 shelf)
            (inReceptacle disk2 shelf)
        )
    )
)