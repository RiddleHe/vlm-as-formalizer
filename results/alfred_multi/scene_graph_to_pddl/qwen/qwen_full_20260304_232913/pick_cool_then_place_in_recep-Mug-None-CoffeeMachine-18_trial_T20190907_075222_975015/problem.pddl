(define (problem cool_cup)
    (:domain put_task)
    (:objects
        robot - agent
        silver_fridge_with_black_handles - fridge
        coffee_maker_with_display - receptacle
        white_cup_on_coffee_maker - object
        copper_vase_left - object
        copper_vase_right - object
    )
    (:init
        (openable silver_fridge_with_black_handles)
        (isOn coffee_maker_with_display)
        (isToggled coffee_maker_with_display)
        (inReceptacle white_cup_on_coffee_maker coffee_maker_with_display)
    )
    (:goal (isCool white_cup_on_coffee_maker))
)