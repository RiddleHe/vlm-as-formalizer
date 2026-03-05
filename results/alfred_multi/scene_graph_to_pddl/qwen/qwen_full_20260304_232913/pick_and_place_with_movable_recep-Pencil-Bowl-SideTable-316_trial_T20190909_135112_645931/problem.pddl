(define (problem place_bowl_with_pencil_on_nightstand)
    (:domain put_task)
    (:objects
        robot - agent
        black_microwave - microwave
        trash_can - fridge
        sink - sink
        blue_pencil - knife
        wooden_desk - receptacle
        nightstand - receptacle
        black_monitor - object
        blue_can - object
        brown_cup - object
        book_with_yellow_cover - object
        laptop - object
        CD - object
        bed_with_blue_blanket - object
        brown_pillow - object
    )
    (:init
        (openable black_microwave)
        (openable trash_can)
        (opened black_microwave)
        (opened trash_can)
        (isOn black_monitor)
        (isOn black_monitor)
        (isOn black_microwave)
        (isOn laptop)
        (isToggled black_microwave)
        (inReceptacle blue_pencil wooden_desk)
        (inReceptacle book_with_yellow_cover wooden_desk)
        (inReceptacle blue_pencil wooden_desk)
        (inReceptacle blue_pencil wooden_desk)
        (inReceptacle CD wooden_desk)
        (inReceptacle laptop wooden_desk)
        (inReceptacle black_monitor wooden_desk)
        (inReceptacle black_monitor wooden_desk)
        (inReceptacle blue_can wooden_desk)
        (inReceptacle brown_cup wooden_desk)
        (inReceptacle black_microwave wooden_desk)
        (inReceptacle book_with_yellow_cover nightstand)
        (inReceptacle brown_pillow bed_with_blue_blanket)
        (not (holdsAny robot))
    )
    (:goal (and
        (inReceptacle blue_pencil nightstand)
    ))
)