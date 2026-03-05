(define (problem move_disks_to_shelf)
    (:domain put_task)
    (:objects
        robot_agent - agent
        wooden_desk_with_shelf - receptacle
        blue_book_with_purpose_8 - object
        silver_laptop - object
        cd_disk_on_desk - object
        cd_disk_on_desk_right - object
        black_office_chair - object
    )
    (:init
        (openable wooden_desk_with_shelf)
        (isOn silver_laptop)
        (atLocation robot_agent wooden_desk_with_shelf)
        (not (holdsAny robot_agent))
        (not (opened wooden_desk_with_shelf))
    )
    (:goal (and
        (inReceptacle cd_disk_on_desk wooden_desk_with_shelf)
        (inReceptacle cd_disk_on_desk_right wooden_desk_with_shelf)
    ))
)