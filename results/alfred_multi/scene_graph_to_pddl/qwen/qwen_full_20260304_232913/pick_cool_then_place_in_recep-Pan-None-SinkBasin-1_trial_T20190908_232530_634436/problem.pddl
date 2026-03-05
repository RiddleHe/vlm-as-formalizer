(define (problem chill_pan_and_put_in_sink)
    (:domain put_task)
    (:objects
        agent1 - agent
        white_fridge_with_silver_handle - fridge
        stainless_steel_sink - sink
        white_cabinet_with_silver_handles - receptacle
        stainless_steel_pan - object
        knife_with_yellow_handle - knife
        red_apple1 - object
        red_apple2 - object
        red_apple3 - object
        tomato - object
        egg - object
        glass_bottle - object
        paper_towel_roll - object
        fork - object
    )
    (:init
        (openable white_fridge_with_silver_handle)
        (openable stainless_steel_sink)
        (openable white_cabinet_with_silver_handles)
        (atLocation agent1 white_cabinet_with_silver_handles)
        (inReceptacle stainless_steel_pan white_cabinet_with_silver_handles)
        (inReceptacle knife_with_yellow_handle white_cabinet_with_silver_handles)
        (inReceptacle red_apple1 white_cabinet_with_silver_handles)
        (inReceptacle red_apple2 white_cabinet_with_silver_handles)
        (inReceptacle red_apple3 white_cabinet_with_silver_handles)
        (inReceptacle tomato white_cabinet_with_silver_handles)
        (inReceptacle egg white_cabinet_with_silver_handles)
        (inReceptacle glass_bottle white_cabinet_with_silver_handles)
        (inReceptacle paper_towel_roll white_cabinet_with_silver_handles)
        (inReceptacle fork stainless_steel_sink)
    )
    (:goal
        (and
            (inReceptacle stainless_steel_pan stainless_steel_sink)
            (isCool stainless_steel_pan)
        )
    )
)