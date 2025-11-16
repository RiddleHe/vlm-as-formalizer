
(define (problem plan_0_322)
    (:domain put_task)
    (:metric minimize (totalCost))
    (:objects
        agent1 - agent
        Vase - object
        Television - object
        Tomato - object
        Mug - object
        Pencil - object
        Plunger - object
        Pot - object
        SoapBottle - object
        Box - object
        Chair - object
        StoveKnob - object
        Pen - object
        DeskLamp - object
        LaundryHamperLid - object
        Laptop - object
        Footstool - object
        ShowerGlass - object
        Pan - object
        Bowl - object
        ScrubBrush - object
        Boots - object
        ToiletPaper - object
        CreditCard - object
        TeddyBear - object
        FloorLamp - object
        Mirror - object
        Candle - object
        SprayBottle - object
        PaperTowelRoll - object
        Window - object
        Bread - object
        RemoteControl - object
        SoapBar - object
        DishSponge - object
        PaperTowel - object
        Plate - object
        Potato - object
        ToiletPaperRoll - object
        Poster - object
        ShowerDoor - object
        Bathtub - object
        LightSwitch - object
        Watch - object
        Kettle - object
        Egg - object
        TennisRacket - object
        BasketBall - object
        Knife - object
        WateringCan - object
        TissueBox - object
        CellPhone - object
        Apple - object
        Book - object
        Toaster - object
        KeyChain - object
        HousePlant - object
        BaseballBat - object
        CD - object
        Cup - object
        PepperShaker - object
        WineBottle - object
        Pillow - object
        Fork - object
        SaltShaker - object
        Statue - object
        Painting - object
        Blinds - object
        Spoon - object
        Sink - object
        Spatula - object
        Ladle - object
        Cloth - object
        Newspaper - object
        Glassbottle - object
        Lettuce - object
        Curtains - object
        AlarmClock - object
        Towel - object
        ButterKnife - object
        HandTowel - object
        VaseType - otype
        TelevisionType - otype
        TomatoType - otype
        MugType - otype
        PencilType - otype
        PlungerType - otype
        PotType - otype
        SoapBottleType - otype
        BoxType - otype
        ChairType - otype
        StoveKnobType - otype
        PenType - otype
        DeskLampType - otype
        LaundryHamperLidType - otype
        LaptopType - otype
        FootstoolType - otype
        ShowerGlassType - otype
        PanType - otype
        BowlType - otype
        ScrubBrushType - otype
        BootsType - otype
        ToiletPaperType - otype
        CreditCardType - otype
        TeddyBearType - otype
        FloorLampType - otype
        MirrorType - otype
        CandleType - otype
        SprayBottleType - otype
        PaperTowelRollType - otype
        WindowType - otype
        BreadType - otype
        RemoteControlType - otype
        SoapBarType - otype
        DishSpongeType - otype
        PaperTowelType - otype
        PlateType - otype
        PotatoType - otype
        ToiletPaperRollType - otype
        PosterType - otype
        ShowerDoorType - otype
        BathtubType - otype
        LightSwitchType - otype
        WatchType - otype
        KettleType - otype
        EggType - otype
        TennisRacketType - otype
        BasketBallType - otype
        KnifeType - otype
        WateringCanType - otype
        TissueBoxType - otype
        CellPhoneType - otype
        AppleType - otype
        BookType - otype
        ToasterType - otype
        KeyChainType - otype
        HousePlantType - otype
        BaseballBatType - otype
        CDType - otype
        CupType - otype
        PepperShakerType - otype
        WineBottleType - otype
        PillowType - otype
        ForkType - otype
        SaltShakerType - otype
        StatueType - otype
        PaintingType - otype
        BlindsType - otype
        SpoonType - otype
        SinkType - otype
        SpatulaType - otype
        LadleType - otype
        ClothType - otype
        NewspaperType - otype
        GlassbottleType - otype
        LettuceType - otype
        CurtainsType - otype
        AlarmClockType - otype
        TowelType - otype
        ButterKnifeType - otype
        HandTowelType - otype
        ToiletPaperHangerType - rtype
        SideTableType - rtype
        GarbageCanType - rtype
        ShelfType - rtype
        BedType - rtype
        ToiletType - rtype
        ArmChairType - rtype
        HandTowelHolderType - rtype
        MicrowaveType - rtype
        SinkBasinType - rtype
        DeskType - rtype
        CartType - rtype
        DiningTableType - rtype
        DresserType - rtype
        FridgeType - rtype
        OttomanType - rtype
        DrawerType - rtype
        BathtubBasinType - rtype
        CoffeeMachineType - rtype
        CoffeeTableType - rtype
        CabinetType - rtype
        CounterTopType - rtype
        SafeType - rtype
        LaundryHamperType - rtype
        SofaType - rtype
        StoveBurnerType - rtype
        TowelHolderType - rtype


        SprayBottle__minus_6_dot_57165144_comma__minus_6_dot_57165144_comma_2_dot_78491068_comma_2_dot_78491068_comma_0_dot_33033992_comma_0_dot_33033992 - object
        SprayBottle__minus_11_dot_25296_comma__minus_11_dot_25296_comma_2_dot_52678132_comma_2_dot_52678132_comma_0_dot_33033992_comma_0_dot_33033992 - object
        ToiletPaperHanger__minus_5_dot_94_comma__minus_5_dot_94_comma_2_dot_768_comma_2_dot_768_comma_3_dot_22_comma_3_dot_22 - receptacle
        GarbageCan__minus_11_dot_696_comma__minus_11_dot_696_comma__minus_6_dot_24_comma__minus_6_dot_24_comma_0_dot_00419187544_comma_0_dot_00419187544 - receptacle
        BathtubBasin_1_dot_3992_comma_1_dot_3992_comma__minus_0_dot_54_comma__minus_0_dot_54_comma_0_dot_095999956_comma_0_dot_095999956 - receptacle
        Cabinet__minus_12_dot_37948324_comma__minus_12_dot_37948324_comma_1_dot_685427664_comma_1_dot_685427664_comma_1_dot_5627072_comma_1_dot_5627072 - receptacle
        Cabinet__minus_9_dot_220196_comma__minus_9_dot_220196_comma_1_dot_7006768_comma_1_dot_7006768_comma_1_dot_66141832_comma_1_dot_66141832 - receptacle
        Cabinet__minus_5_dot_9847126_comma__minus_5_dot_9847126_comma_1_dot_7006768_comma_1_dot_7006768_comma_1_dot_66141832_comma_1_dot_66141832 - receptacle
        Cabinet__minus_9_dot_144_comma__minus_9_dot_144_comma_1_dot_685427664_comma_1_dot_685427664_comma_1_dot_5627072_comma_1_dot_5627072 - receptacle
        Toilet__minus_4_dot_216_comma__minus_4_dot_216_comma_2_dot_212_comma_2_dot_212_comma_0_dot_00419187544_comma_0_dot_00419187544 - receptacle
        TowelHolder__minus_1_dot_96_comma__minus_1_dot_96_comma_4_dot_03821756_comma_4_dot_03821756_comma_5_dot_412_comma_5_dot_412 - receptacle
        CounterTop__minus_9_dot_192_comma__minus_9_dot_192_comma_2_dot_756_comma_2_dot_756_comma_3_dot_812_comma_3_dot_812 - receptacle
        SinkBasin__minus_10_dot_6652_comma__minus_10_dot_6652_comma_2_dot_6772_comma_2_dot_6772_comma_3_dot_8468_comma_3_dot_8468 - receptacle
        SinkBasin__minus_7_dot_6356_comma__minus_7_dot_6356_comma_2_dot_6772_comma_2_dot_6772_comma_3_dot_8468_comma_3_dot_8468 - receptacle
        HandTowelHolder__minus_12_dot_53885268_comma__minus_12_dot_53885268_comma_2_dot_976_comma_2_dot_976_comma_6_dot_756_comma_6_dot_756 - receptacle
        loc_bar__minus_6_bar_0_bar_0_bar_45 - location
        loc_bar__minus_9_bar__minus_2_bar_2_bar_60 - location
        loc_bar__minus_10_bar__minus_2_bar_0_bar_60 - location
        loc_bar__minus_11_bar_0_bar_0_bar_45 - location
        loc_bar__minus_9_bar__minus_2_bar_0_bar_60 - location
        loc_bar__minus_11_bar_0_bar_0_bar_60 - location
        loc_bar__minus_3_bar__minus_1_bar_1_bar_60 - location
        loc_bar__minus_7_bar_0_bar_0_bar_45 - location
        loc_bar__minus_8_bar__minus_2_bar_0_bar_60 - location
        loc_bar__minus_2_bar_2_bar_3_bar_15 - location
        loc_bar__minus_10_bar_0_bar_0_bar_45 - location
        loc_bar__minus_7_bar_0_bar_0_bar_60 - location
        loc_bar__minus_6_bar__minus_2_bar_0_bar_60 - location
        loc_bar__minus_11_bar_0_bar_0_bar_0 - location
        loc_bar__minus_2_bar_2_bar_0_bar_30 - location
        loc_bar__minus_6_bar__minus_1_bar_1_bar_30 - location
        )


    (:init
        (= (totalCost) 0)
        (canContain ToiletPaperHangerType ToiletPaperType)
        (canContain ToiletPaperHangerType ToiletPaperRollType)
        (canContain BathtubBasinType DishSpongeType)
        (canContain BathtubBasinType SoapBarType)
        (canContain BathtubBasinType ClothType)
        (canContain BathtubBasinType HandTowelType)
        (canContain SideTableType VaseType)
        (canContain SideTableType TomatoType)
        (canContain SideTableType PencilType)
        (canContain SideTableType MugType)
        (canContain SideTableType PotType)
        (canContain SideTableType SoapBottleType)
        (canContain SideTableType BoxType)
        (canContain SideTableType PenType)
        (canContain SideTableType LaptopType)
        (canContain SideTableType PanType)
        (canContain SideTableType BowlType)
        (canContain SideTableType ToiletPaperType)
        (canContain SideTableType CreditCardType)
        (canContain SideTableType CandleType)
        (canContain SideTableType RemoteControlType)
        (canContain SideTableType SprayBottleType)
        (canContain SideTableType SoapBarType)
        (canContain SideTableType BreadType)
        (canContain SideTableType PaperTowelType)
        (canContain SideTableType DishSpongeType)
        (canContain SideTableType PlateType)
        (canContain SideTableType PotatoType)
        (canContain SideTableType ToiletPaperRollType)
        (canContain SideTableType WatchType)
        (canContain SideTableType TennisRacketType)
        (canContain SideTableType KettleType)
        (canContain SideTableType EggType)
        (canContain SideTableType WateringCanType)
        (canContain SideTableType KnifeType)
        (canContain SideTableType BasketBallType)
        (canContain SideTableType TissueBoxType)
        (canContain SideTableType CellPhoneType)
        (canContain SideTableType BookType)
        (canContain SideTableType AppleType)
        (canContain SideTableType KeyChainType)
        (canContain SideTableType BaseballBatType)
        (canContain SideTableType CDType)
        (canContain SideTableType WineBottleType)
        (canContain SideTableType PepperShakerType)
        (canContain SideTableType CupType)
        (canContain SideTableType StatueType)
        (canContain SideTableType ForkType)
        (canContain SideTableType SpoonType)
        (canContain SideTableType SpatulaType)
        (canContain SideTableType LadleType)
        (canContain SideTableType ClothType)
        (canContain SideTableType GlassbottleType)
        (canContain SideTableType LettuceType)
        (canContain SideTableType NewspaperType)
        (canContain SideTableType AlarmClockType)
        (canContain SideTableType SaltShakerType)
        (canContain SideTableType ButterKnifeType)
        (canContain SideTableType HandTowelType)
        (canContain DrawerType PencilType)
        (canContain DrawerType SoapBottleType)
        (canContain DrawerType PenType)
        (canContain DrawerType ToiletPaperType)
        (canContain DrawerType CreditCardType)
        (canContain DrawerType CandleType)
        (canContain DrawerType RemoteControlType)
        (canContain DrawerType SprayBottleType)
        (canContain DrawerType SoapBarType)
        (canContain DrawerType DishSpongeType)
        (canContain DrawerType ToiletPaperRollType)
        (canContain DrawerType WatchType)
        (canContain DrawerType WateringCanType)
        (canContain DrawerType KnifeType)
        (canContain DrawerType TissueBoxType)
        (canContain DrawerType CellPhoneType)
        (canContain DrawerType BookType)
        (canContain DrawerType KeyChainType)
        (canContain DrawerType CDType)
        (canContain DrawerType PepperShakerType)
        (canContain DrawerType ForkType)
        (canContain DrawerType SpoonType)
        (canContain DrawerType SpatulaType)
        (canContain DrawerType LadleType)
        (canContain DrawerType ClothType)
        (canContain DrawerType NewspaperType)
        (canContain DrawerType SaltShakerType)
        (canContain DrawerType ButterKnifeType)
        (canContain DrawerType HandTowelType)
        (canContain CabinetType VaseType)
        (canContain CabinetType MugType)
        (canContain CabinetType PotType)
        (canContain CabinetType PlungerType)
        (canContain CabinetType SoapBottleType)
        (canContain CabinetType BoxType)
        (canContain CabinetType PanType)
        (canContain CabinetType BowlType)
        (canContain CabinetType ToiletPaperType)
        (canContain CabinetType CandleType)
        (canContain CabinetType SprayBottleType)
        (canContain CabinetType SoapBarType)
        (canContain CabinetType DishSpongeType)
        (canContain CabinetType PlateType)
        (canContain CabinetType ToiletPaperRollType)
        (canContain CabinetType KettleType)
        (canContain CabinetType WateringCanType)
        (canContain CabinetType TissueBoxType)
        (canContain CabinetType BookType)
        (canContain CabinetType CDType)
        (canContain CabinetType PepperShakerType)
        (canContain CabinetType WineBottleType)
        (canContain CabinetType CupType)
        (canContain CabinetType LadleType)
        (canContain CabinetType ClothType)
        (canContain CabinetType GlassbottleType)
        (canContain CabinetType NewspaperType)
        (canContain CabinetType SaltShakerType)
        (canContain CabinetType HandTowelType)
        (canContain CoffeeMachineType MugType)
        (canContain ShelfType VaseType)
        (canContain ShelfType PencilType)
        (canContain ShelfType MugType)
        (canContain ShelfType PotType)
        (canContain ShelfType SoapBottleType)
        (canContain ShelfType BoxType)
        (canContain ShelfType PenType)
        (canContain ShelfType BowlType)
        (canContain ShelfType ToiletPaperType)
        (canContain ShelfType CreditCardType)
        (canContain ShelfType CandleType)
        (canContain ShelfType RemoteControlType)
        (canContain ShelfType SprayBottleType)
        (canContain ShelfType SoapBarType)
        (canContain ShelfType PaperTowelType)
        (canContain ShelfType DishSpongeType)
        (canContain ShelfType PlateType)
        (canContain ShelfType ToiletPaperRollType)
        (canContain ShelfType WatchType)
        (canContain ShelfType KettleType)
        (canContain ShelfType WateringCanType)
        (canContain ShelfType TissueBoxType)
        (canContain ShelfType CellPhoneType)
        (canContain ShelfType BookType)
        (canContain ShelfType KeyChainType)
        (canContain ShelfType CDType)
        (canContain ShelfType PepperShakerType)
        (canContain ShelfType WineBottleType)
        (canContain ShelfType CupType)
        (canContain ShelfType StatueType)
        (canContain ShelfType ClothType)
        (canContain ShelfType GlassbottleType)
        (canContain ShelfType NewspaperType)
        (canContain ShelfType AlarmClockType)
        (canContain ShelfType SaltShakerType)
        (canContain ShelfType HandTowelType)
        (canContain BedType TennisRacketType)
        (canContain BedType LaptopType)
        (canContain BedType BasketBallType)
        (canContain BedType CellPhoneType)
        (canContain BedType BookType)
        (canContain BedType BaseballBatType)
        (canContain BedType NewspaperType)
        (canContain BedType PillowType)
        (canContain ToiletType ToiletPaperType)
        (canContain ToiletType CandleType)
        (canContain ToiletType SprayBottleType)
        (canContain ToiletType SoapBarType)
        (canContain ToiletType TissueBoxType)
        (canContain ToiletType PaperTowelType)
        (canContain ToiletType DishSpongeType)
        (canContain ToiletType SoapBottleType)
        (canContain ToiletType ClothType)
        (canContain ToiletType NewspaperType)
        (canContain ToiletType ToiletPaperRollType)
        (canContain ToiletType HandTowelType)
        (canContain ArmChairType CreditCardType)
        (canContain ArmChairType RemoteControlType)
        (canContain ArmChairType LaptopType)
        (canContain ArmChairType BasketBallType)
        (canContain ArmChairType CellPhoneType)
        (canContain ArmChairType BookType)
        (canContain ArmChairType ClothType)
        (canContain ArmChairType KeyChainType)
        (canContain ArmChairType BoxType)
        (canContain ArmChairType NewspaperType)
        (canContain ArmChairType PillowType)
        (canContain HandTowelHolderType HandTowelType)
        (canContain SinkBasinType TomatoType)
        (canContain SinkBasinType MugType)
        (canContain SinkBasinType PotType)
        (canContain SinkBasinType PanType)
        (canContain SinkBasinType BowlType)
        (canContain SinkBasinType SoapBarType)
        (canContain SinkBasinType DishSpongeType)
        (canContain SinkBasinType PlateType)
        (canContain SinkBasinType PotatoType)
        (canContain SinkBasinType KettleType)
        (canContain SinkBasinType EggType)
        (canContain SinkBasinType KnifeType)
        (canContain SinkBasinType AppleType)
        (canContain SinkBasinType CupType)
        (canContain SinkBasinType ForkType)
        (canContain SinkBasinType SpoonType)
        (canContain SinkBasinType SpatulaType)
        (canContain SinkBasinType LadleType)
        (canContain SinkBasinType ClothType)
        (canContain SinkBasinType GlassbottleType)
        (canContain SinkBasinType LettuceType)
        (canContain SinkBasinType ButterKnifeType)
        (canContain SinkBasinType HandTowelType)
        (canContain SafeType VaseType)
        (canContain SafeType WatchType)
        (canContain SafeType CreditCardType)
        (canContain SafeType CellPhoneType)
        (canContain SafeType KeyChainType)
        (canContain SafeType CDType)
        (canContain SafeType StatueType)
        (canContain DeskType VaseType)
        (canContain DeskType PencilType)
        (canContain DeskType MugType)
        (canContain DeskType SoapBottleType)
        (canContain DeskType BoxType)
        (canContain DeskType PenType)
        (canContain DeskType LaptopType)
        (canContain DeskType BowlType)
        (canContain DeskType ToiletPaperType)
        (canContain DeskType CreditCardType)
        (canContain DeskType CandleType)
        (canContain DeskType RemoteControlType)
        (canContain DeskType SprayBottleType)
        (canContain DeskType PlateType)
        (canContain DeskType ToiletPaperRollType)
        (canContain DeskType WatchType)
        (canContain DeskType TennisRacketType)
        (canContain DeskType WateringCanType)
        (canContain DeskType BasketBallType)
        (canContain DeskType TissueBoxType)
        (canContain DeskType CellPhoneType)
        (canContain DeskType BookType)
        (canContain DeskType KeyChainType)
        (canContain DeskType CDType)
        (canContain DeskType CupType)
        (canContain DeskType WineBottleType)
        (canContain DeskType StatueType)
        (canContain DeskType ClothType)
        (canContain DeskType GlassbottleType)
        (canContain DeskType NewspaperType)
        (canContain DeskType AlarmClockType)
        (canContain LaundryHamperType ClothType)
        (canContain SofaType CreditCardType)
        (canContain SofaType RemoteControlType)
        (canContain SofaType LaptopType)
        (canContain SofaType BasketBallType)
        (canContain SofaType CellPhoneType)
        (canContain SofaType BookType)
        (canContain SofaType ClothType)
        (canContain SofaType KeyChainType)
        (canContain SofaType BoxType)
        (canContain SofaType NewspaperType)
        (canContain SofaType PillowType)
        (canContain MicrowaveType EggType)
        (canContain MicrowaveType TomatoType)
        (canContain MicrowaveType BreadType)
        (canContain MicrowaveType MugType)
        (canContain MicrowaveType AppleType)
        (canContain MicrowaveType PlateType)
        (canContain MicrowaveType PotatoType)
        (canContain MicrowaveType GlassbottleType)
        (canContain MicrowaveType CupType)
        (canContain MicrowaveType BowlType)
        (canContain DiningTableType VaseType)
        (canContain DiningTableType TomatoType)
        (canContain DiningTableType PencilType)
        (canContain DiningTableType MugType)
        (canContain DiningTableType PotType)
        (canContain DiningTableType SoapBottleType)
        (canContain DiningTableType BoxType)
        (canContain DiningTableType PenType)
        (canContain DiningTableType LaptopType)
        (canContain DiningTableType PanType)
        (canContain DiningTableType BowlType)
        (canContain DiningTableType ToiletPaperType)
        (canContain DiningTableType CreditCardType)
        (canContain DiningTableType CandleType)
        (canContain DiningTableType RemoteControlType)
        (canContain DiningTableType SprayBottleType)
        (canContain DiningTableType SoapBarType)
        (canContain DiningTableType BreadType)
        (canContain DiningTableType PaperTowelType)
        (canContain DiningTableType DishSpongeType)
        (canContain DiningTableType PlateType)
        (canContain DiningTableType PotatoType)
        (canContain DiningTableType ToiletPaperRollType)
        (canContain DiningTableType WatchType)
        (canContain DiningTableType TennisRacketType)
        (canContain DiningTableType KettleType)
        (canContain DiningTableType EggType)
        (canContain DiningTableType WateringCanType)
        (canContain DiningTableType KnifeType)
        (canContain DiningTableType BasketBallType)
        (canContain DiningTableType TissueBoxType)
        (canContain DiningTableType CellPhoneType)
        (canContain DiningTableType BookType)
        (canContain DiningTableType AppleType)
        (canContain DiningTableType KeyChainType)
        (canContain DiningTableType BaseballBatType)
        (canContain DiningTableType CDType)
        (canContain DiningTableType WineBottleType)
        (canContain DiningTableType PepperShakerType)
        (canContain DiningTableType CupType)
        (canContain DiningTableType StatueType)
        (canContain DiningTableType ForkType)
        (canContain DiningTableType SpoonType)
        (canContain DiningTableType SpatulaType)
        (canContain DiningTableType LadleType)
        (canContain DiningTableType ClothType)
        (canContain DiningTableType GlassbottleType)
        (canContain DiningTableType LettuceType)
        (canContain DiningTableType NewspaperType)
        (canContain DiningTableType AlarmClockType)
        (canContain DiningTableType SaltShakerType)
        (canContain DiningTableType ButterKnifeType)
        (canContain DiningTableType HandTowelType)
        (canContain CoffeeTableType VaseType)
        (canContain CoffeeTableType TomatoType)
        (canContain CoffeeTableType PencilType)
        (canContain CoffeeTableType MugType)
        (canContain CoffeeTableType PotType)
        (canContain CoffeeTableType SoapBottleType)
        (canContain CoffeeTableType BoxType)
        (canContain CoffeeTableType PenType)
        (canContain CoffeeTableType LaptopType)
        (canContain CoffeeTableType PanType)
        (canContain CoffeeTableType BowlType)
        (canContain CoffeeTableType ToiletPaperType)
        (canContain CoffeeTableType CreditCardType)
        (canContain CoffeeTableType CandleType)
        (canContain CoffeeTableType RemoteControlType)
        (canContain CoffeeTableType SprayBottleType)
        (canContain CoffeeTableType SoapBarType)
        (canContain CoffeeTableType BreadType)
        (canContain CoffeeTableType PaperTowelType)
        (canContain CoffeeTableType DishSpongeType)
        (canContain CoffeeTableType PlateType)
        (canContain CoffeeTableType PotatoType)
        (canContain CoffeeTableType ToiletPaperRollType)
        (canContain CoffeeTableType WatchType)
        (canContain CoffeeTableType TennisRacketType)
        (canContain CoffeeTableType KettleType)
        (canContain CoffeeTableType EggType)
        (canContain CoffeeTableType WateringCanType)
        (canContain CoffeeTableType KnifeType)
        (canContain CoffeeTableType BasketBallType)
        (canContain CoffeeTableType TissueBoxType)
        (canContain CoffeeTableType CellPhoneType)
        (canContain CoffeeTableType BookType)
        (canContain CoffeeTableType AppleType)
        (canContain CoffeeTableType KeyChainType)
        (canContain CoffeeTableType BaseballBatType)
        (canContain CoffeeTableType CDType)
        (canContain CoffeeTableType WineBottleType)
        (canContain CoffeeTableType PepperShakerType)
        (canContain CoffeeTableType CupType)
        (canContain CoffeeTableType StatueType)
        (canContain CoffeeTableType ForkType)
        (canContain CoffeeTableType SpoonType)
        (canContain CoffeeTableType SpatulaType)
        (canContain CoffeeTableType LadleType)
        (canContain CoffeeTableType ClothType)
        (canContain CoffeeTableType GlassbottleType)
        (canContain CoffeeTableType LettuceType)
        (canContain CoffeeTableType NewspaperType)
        (canContain CoffeeTableType AlarmClockType)
        (canContain CoffeeTableType SaltShakerType)
        (canContain CoffeeTableType ButterKnifeType)
        (canContain CoffeeTableType HandTowelType)
        (canContain CounterTopType VaseType)
        (canContain CounterTopType TomatoType)
        (canContain CounterTopType PencilType)
        (canContain CounterTopType MugType)
        (canContain CounterTopType PotType)
        (canContain CounterTopType SoapBottleType)
        (canContain CounterTopType BoxType)
        (canContain CounterTopType PenType)
        (canContain CounterTopType LaptopType)
        (canContain CounterTopType PanType)
        (canContain CounterTopType BowlType)
        (canContain CounterTopType ToiletPaperType)
        (canContain CounterTopType CreditCardType)
        (canContain CounterTopType CandleType)
        (canContain CounterTopType RemoteControlType)
        (canContain CounterTopType SprayBottleType)
        (canContain CounterTopType SoapBarType)
        (canContain CounterTopType BreadType)
        (canContain CounterTopType PaperTowelType)
        (canContain CounterTopType DishSpongeType)
        (canContain CounterTopType PlateType)
        (canContain CounterTopType PotatoType)
        (canContain CounterTopType ToiletPaperRollType)
        (canContain CounterTopType WatchType)
        (canContain CounterTopType TennisRacketType)
        (canContain CounterTopType KettleType)
        (canContain CounterTopType EggType)
        (canContain CounterTopType WateringCanType)
        (canContain CounterTopType KnifeType)
        (canContain CounterTopType BasketBallType)
        (canContain CounterTopType TissueBoxType)
        (canContain CounterTopType CellPhoneType)
        (canContain CounterTopType BookType)
        (canContain CounterTopType AppleType)
        (canContain CounterTopType KeyChainType)
        (canContain CounterTopType BaseballBatType)
        (canContain CounterTopType CDType)
        (canContain CounterTopType WineBottleType)
        (canContain CounterTopType PepperShakerType)
        (canContain CounterTopType CupType)
        (canContain CounterTopType StatueType)
        (canContain CounterTopType ForkType)
        (canContain CounterTopType SpoonType)
        (canContain CounterTopType SpatulaType)
        (canContain CounterTopType LadleType)
        (canContain CounterTopType ClothType)
        (canContain CounterTopType GlassbottleType)
        (canContain CounterTopType LettuceType)
        (canContain CounterTopType NewspaperType)
        (canContain CounterTopType AlarmClockType)
        (canContain CounterTopType SaltShakerType)
        (canContain CounterTopType ButterKnifeType)
        (canContain CounterTopType HandTowelType)
        (canContain DresserType VaseType)
        (canContain DresserType PencilType)
        (canContain DresserType MugType)
        (canContain DresserType BoxType)
        (canContain DresserType PenType)
        (canContain DresserType LaptopType)
        (canContain DresserType BowlType)
        (canContain DresserType ToiletPaperType)
        (canContain DresserType CreditCardType)
        (canContain DresserType CandleType)
        (canContain DresserType RemoteControlType)
        (canContain DresserType SprayBottleType)
        (canContain DresserType PlateType)
        (canContain DresserType ToiletPaperRollType)
        (canContain DresserType WatchType)
        (canContain DresserType TennisRacketType)
        (canContain DresserType WateringCanType)
        (canContain DresserType BasketBallType)
        (canContain DresserType TissueBoxType)
        (canContain DresserType CellPhoneType)
        (canContain DresserType BookType)
        (canContain DresserType KeyChainType)
        (canContain DresserType CDType)
        (canContain DresserType CupType)
        (canContain DresserType WineBottleType)
        (canContain DresserType StatueType)
        (canContain DresserType ClothType)
        (canContain DresserType GlassbottleType)
        (canContain DresserType NewspaperType)
        (canContain DresserType AlarmClockType)
        (canContain StoveBurnerType KettleType)
        (canContain StoveBurnerType PanType)
        (canContain StoveBurnerType PotType)
        (canContain TowelHolderType TowelType)
        (canContain FridgeType EggType)
        (canContain FridgeType TomatoType)
        (canContain FridgeType BreadType)
        (canContain FridgeType MugType)
        (canContain FridgeType PotType)
        (canContain FridgeType AppleType)
        (canContain FridgeType PlateType)
        (canContain FridgeType PotatoType)
        (canContain FridgeType GlassbottleType)
        (canContain FridgeType LettuceType)
        (canContain FridgeType WineBottleType)
        (canContain FridgeType CupType)
        (canContain FridgeType PanType)
        (canContain FridgeType BowlType)
        (canContain CartType VaseType)
        (canContain CartType ToiletPaperType)
        (canContain CartType CandleType)
        (canContain CartType SprayBottleType)
        (canContain CartType SoapBarType)
        (canContain CartType MugType)
        (canContain CartType TissueBoxType)
        (canContain CartType PlungerType)
        (canContain CartType PaperTowelType)
        (canContain CartType DishSpongeType)
        (canContain CartType SoapBottleType)
        (canContain CartType ClothType)
        (canContain CartType ToiletPaperRollType)
        (canContain CartType StatueType)
        (canContain CartType HandTowelType)
        (canContain OttomanType CreditCardType)
        (canContain OttomanType RemoteControlType)
        (canContain OttomanType LaptopType)
        (canContain OttomanType BasketBallType)
        (canContain OttomanType CellPhoneType)
        (canContain OttomanType BookType)
        (canContain OttomanType ClothType)
        (canContain OttomanType KeyChainType)
        (canContain OttomanType BoxType)
        (canContain OttomanType NewspaperType)
        (canContain OttomanType PillowType)


        (receptacleType ToiletPaperHanger__minus_5_dot_94_comma__minus_5_dot_94_comma_2_dot_768_comma_2_dot_768_comma_3_dot_22_comma_3_dot_22 ToiletPaperHangerType)
        (receptacleType GarbageCan__minus_11_dot_696_comma__minus_11_dot_696_comma__minus_6_dot_24_comma__minus_6_dot_24_comma_0_dot_00419187544_comma_0_dot_00419187544 GarbageCanType)
        (receptacleType BathtubBasin_1_dot_3992_comma_1_dot_3992_comma__minus_0_dot_54_comma__minus_0_dot_54_comma_0_dot_095999956_comma_0_dot_095999956 BathtubBasinType)
        (receptacleType Cabinet__minus_12_dot_37948324_comma__minus_12_dot_37948324_comma_1_dot_685427664_comma_1_dot_685427664_comma_1_dot_5627072_comma_1_dot_5627072 CabinetType)
        (receptacleType Cabinet__minus_9_dot_220196_comma__minus_9_dot_220196_comma_1_dot_7006768_comma_1_dot_7006768_comma_1_dot_66141832_comma_1_dot_66141832 CabinetType)
        (receptacleType Cabinet__minus_5_dot_9847126_comma__minus_5_dot_9847126_comma_1_dot_7006768_comma_1_dot_7006768_comma_1_dot_66141832_comma_1_dot_66141832 CabinetType)
        (receptacleType Cabinet__minus_9_dot_144_comma__minus_9_dot_144_comma_1_dot_685427664_comma_1_dot_685427664_comma_1_dot_5627072_comma_1_dot_5627072 CabinetType)
        (receptacleType Toilet__minus_4_dot_216_comma__minus_4_dot_216_comma_2_dot_212_comma_2_dot_212_comma_0_dot_00419187544_comma_0_dot_00419187544 ToiletType)
        (receptacleType TowelHolder__minus_1_dot_96_comma__minus_1_dot_96_comma_4_dot_03821756_comma_4_dot_03821756_comma_5_dot_412_comma_5_dot_412 TowelHolderType)
        (receptacleType CounterTop__minus_9_dot_192_comma__minus_9_dot_192_comma_2_dot_756_comma_2_dot_756_comma_3_dot_812_comma_3_dot_812 CounterTopType)
        (receptacleType SinkBasin__minus_10_dot_6652_comma__minus_10_dot_6652_comma_2_dot_6772_comma_2_dot_6772_comma_3_dot_8468_comma_3_dot_8468 SinkBasinType)
        (receptacleType SinkBasin__minus_7_dot_6356_comma__minus_7_dot_6356_comma_2_dot_6772_comma_2_dot_6772_comma_3_dot_8468_comma_3_dot_8468 SinkBasinType)
        (receptacleType HandTowelHolder__minus_12_dot_53885268_comma__minus_12_dot_53885268_comma_2_dot_976_comma_2_dot_976_comma_6_dot_756_comma_6_dot_756 HandTowelHolderType)
        (objectType SprayBottle__minus_6_dot_57165144_comma__minus_6_dot_57165144_comma_2_dot_78491068_comma_2_dot_78491068_comma_0_dot_33033992_comma_0_dot_33033992 SprayBottleType)
        (objectType SprayBottle__minus_11_dot_25296_comma__minus_11_dot_25296_comma_2_dot_52678132_comma_2_dot_52678132_comma_0_dot_33033992_comma_0_dot_33033992 SprayBottleType)
        
        (openable Cabinet__minus_12_dot_37948324_comma__minus_12_dot_37948324_comma_1_dot_685427664_comma_1_dot_685427664_comma_1_dot_5627072_comma_1_dot_5627072)
        (openable Cabinet__minus_9_dot_220196_comma__minus_9_dot_220196_comma_1_dot_7006768_comma_1_dot_7006768_comma_1_dot_66141832_comma_1_dot_66141832)
        (openable Cabinet__minus_5_dot_9847126_comma__minus_5_dot_9847126_comma_1_dot_7006768_comma_1_dot_7006768_comma_1_dot_66141832_comma_1_dot_66141832)
        (openable Cabinet__minus_9_dot_144_comma__minus_9_dot_144_comma_1_dot_685427664_comma_1_dot_685427664_comma_1_dot_5627072_comma_1_dot_5627072)
        
        (atLocation agent1 loc_bar__minus_6_bar__minus_1_bar_1_bar_30)
        
        
        
        
        
        
        
        
        
        
        
        
        (inReceptacle SprayBottle__minus_11_dot_25296_comma__minus_11_dot_25296_comma_2_dot_52678132_comma_2_dot_52678132_comma_0_dot_33033992_comma_0_dot_33033992 Cabinet__minus_12_dot_37948324_comma__minus_12_dot_37948324_comma_1_dot_685427664_comma_1_dot_685427664_comma_1_dot_5627072_comma_1_dot_5627072)
        (inReceptacle SprayBottle__minus_6_dot_57165144_comma__minus_6_dot_57165144_comma_2_dot_78491068_comma_2_dot_78491068_comma_0_dot_33033992_comma_0_dot_33033992 Cabinet__minus_5_dot_9847126_comma__minus_5_dot_9847126_comma_1_dot_7006768_comma_1_dot_7006768_comma_1_dot_66141832_comma_1_dot_66141832)
        (wasInReceptacle  SprayBottle__minus_11_dot_25296_comma__minus_11_dot_25296_comma_2_dot_52678132_comma_2_dot_52678132_comma_0_dot_33033992_comma_0_dot_33033992 Cabinet__minus_12_dot_37948324_comma__minus_12_dot_37948324_comma_1_dot_685427664_comma_1_dot_685427664_comma_1_dot_5627072_comma_1_dot_5627072)
        (wasInReceptacle  SprayBottle__minus_6_dot_57165144_comma__minus_6_dot_57165144_comma_2_dot_78491068_comma_2_dot_78491068_comma_0_dot_33033992_comma_0_dot_33033992 Cabinet__minus_5_dot_9847126_comma__minus_5_dot_9847126_comma_1_dot_7006768_comma_1_dot_7006768_comma_1_dot_66141832_comma_1_dot_66141832)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 9)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_6_bar_0_bar_0_bar_45) 9)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 12)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar_0_bar_0_bar_45) 12)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_6_bar_0_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 11)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar_0_bar_0_bar_45) 11)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_60) 9)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_6_bar_0_bar_0_bar_45) 9)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 6)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_6_bar_0_bar_0_bar_45) 6)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 9)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_6_bar_0_bar_0_bar_45) 9)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_7_bar_0_bar_0_bar_45) 4)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_6_bar_0_bar_0_bar_45) 4)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 10)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar_0_bar_0_bar_45) 10)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_2_bar_2_bar_3_bar_15) 12)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_6_bar_0_bar_0_bar_45) 12)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_10_bar_0_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_6_bar_0_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_7_bar_0_bar_0_bar_60) 5)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_6_bar_0_bar_0_bar_45) 5)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar_0_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_0) 11)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_6_bar_0_bar_0_bar_45) 11)
        (= (distance loc_bar__minus_6_bar_0_bar_0_bar_45 loc_bar__minus_2_bar_2_bar_0_bar_30) 10)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_6_bar_0_bar_0_bar_45) 10)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 4)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 4)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 8)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 3)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 3)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 7)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 10)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 10)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 11)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 11)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 8)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 4)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 4)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_2_bar_2_bar_3_bar_15) 18)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 18)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_10_bar_0_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 7)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 7)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 6)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 6)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_0) 11)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 11)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_2_bar_60 loc_bar__minus_2_bar_2_bar_0_bar_30) 16)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_9_bar__minus_2_bar_2_bar_60) 16)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 4)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 4)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_60) 6)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 6)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 9)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 9)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 10)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 10)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_45) 9)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 9)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 5)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 5)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_3_bar_15) 19)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 19)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_10_bar_0_bar_0_bar_45) 4)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 4)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_0) 10)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 10)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_0_bar_30) 17)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_10_bar__minus_2_bar_0_bar_60) 17)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 10)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_45) 10)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_60) 2)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_45) 2)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 11)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_11_bar_0_bar_0_bar_45) 11)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 14)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_45) 14)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_7_bar_0_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 11)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_45) 11)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_2_bar_2_bar_3_bar_15) 17)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_11_bar_0_bar_0_bar_45) 17)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_10_bar_0_bar_0_bar_45) 4)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_45) 4)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_7_bar_0_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 13)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_45) 13)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_0) 4)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_11_bar_0_bar_0_bar_45) 4)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_45 loc_bar__minus_2_bar_2_bar_0_bar_30) 15)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_11_bar_0_bar_0_bar_45) 15)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 8)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 9)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 9)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 4)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 4)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_3_bar_15) 18)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 18)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_10_bar_0_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 6)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 6)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_0) 11)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 11)
        (= (distance loc_bar__minus_9_bar__minus_2_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_0_bar_30) 16)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_9_bar__minus_2_bar_0_bar_60) 16)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 12)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_11_bar_0_bar_0_bar_60) 12)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 13)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_60) 13)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 10)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_60) 10)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_3_bar_15) 18)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_11_bar_0_bar_0_bar_60) 18)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_10_bar_0_bar_0_bar_45) 5)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_60) 5)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 12)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_60) 12)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_0) 5)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_11_bar_0_bar_0_bar_60) 5)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_0_bar_30) 16)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_11_bar_0_bar_0_bar_60) 16)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 6)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 6)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_7_bar_0_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 7)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 9)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 9)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_2_bar_2_bar_3_bar_15) 11)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 11)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_10_bar_0_bar_0_bar_45) 10)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 10)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_7_bar_0_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 8)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 7)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_11_bar_0_bar_0_bar_0) 12)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 12)
        (= (distance loc_bar__minus_6_bar__minus_1_bar_1_bar_30 loc_bar__minus_2_bar_2_bar_0_bar_30) 9)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_6_bar__minus_1_bar_1_bar_30) 9)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_45) 10)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 10)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 10)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 10)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_2_bar_2_bar_3_bar_15) 10)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 10)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_10_bar_0_bar_0_bar_45) 13)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 13)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_60) 9)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 9)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 8)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_0) 17)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 17)
        (= (distance loc_bar__minus_3_bar__minus_1_bar_1_bar_60 loc_bar__minus_2_bar_2_bar_0_bar_30) 8)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_3_bar__minus_1_bar_1_bar_60) 8)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 9)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_45) 9)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_2_bar_2_bar_3_bar_15) 13)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_7_bar_0_bar_0_bar_45) 13)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_10_bar_0_bar_0_bar_45) 6)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_7_bar_0_bar_0_bar_45) 6)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_7_bar_0_bar_0_bar_60) 2)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_45) 2)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 9)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_45) 9)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_0) 10)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_7_bar_0_bar_0_bar_45) 10)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_45 loc_bar__minus_2_bar_2_bar_0_bar_30) 11)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_7_bar_0_bar_0_bar_45) 11)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_3_bar_15) 17)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 17)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_10_bar_0_bar_0_bar_45) 8)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_60) 6)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 6)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 5)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 5)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_0) 12)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 12)
        (= (distance loc_bar__minus_8_bar__minus_2_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_0_bar_30) 15)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_8_bar__minus_2_bar_0_bar_60) 15)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_10_bar_0_bar_0_bar_45) 16)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_2_bar_2_bar_3_bar_15) 16)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_7_bar_0_bar_0_bar_60) 14)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_3_bar_15) 14)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 15)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_3_bar_15) 15)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_11_bar_0_bar_0_bar_0) 16)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_2_bar_2_bar_3_bar_15) 16)
        (= (distance loc_bar__minus_2_bar_2_bar_3_bar_15 loc_bar__minus_2_bar_2_bar_0_bar_30) 3)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_2_bar_2_bar_3_bar_15) 3)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_7_bar_0_bar_0_bar_60) 7)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_10_bar_0_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 12)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_10_bar_0_bar_0_bar_45) 12)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_11_bar_0_bar_0_bar_0) 7)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_10_bar_0_bar_0_bar_45) 7)
        (= (distance loc_bar__minus_10_bar_0_bar_0_bar_45 loc_bar__minus_2_bar_2_bar_0_bar_30) 14)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_10_bar_0_bar_0_bar_45) 14)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_7_bar_0_bar_0_bar_60) 8)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_0) 11)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_7_bar_0_bar_0_bar_60) 11)
        (= (distance loc_bar__minus_7_bar_0_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_0_bar_30) 12)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_7_bar_0_bar_0_bar_60) 12)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_11_bar_0_bar_0_bar_0) 14)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 14)
        (= (distance loc_bar__minus_6_bar__minus_2_bar_0_bar_60 loc_bar__minus_2_bar_2_bar_0_bar_30) 13)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_6_bar__minus_2_bar_0_bar_60) 13)
        (= (distance loc_bar__minus_11_bar_0_bar_0_bar_0 loc_bar__minus_2_bar_2_bar_0_bar_30) 16)
        (= (distance loc_bar__minus_2_bar_2_bar_0_bar_30 loc_bar__minus_11_bar_0_bar_0_bar_0) 16)
        (receptacleAtLocation ToiletPaperHanger__minus_5_dot_94_comma__minus_5_dot_94_comma_2_dot_768_comma_2_dot_768_comma_3_dot_22_comma_3_dot_22 loc_bar__minus_6_bar_0_bar_0_bar_45)
        (receptacleAtLocation GarbageCan__minus_11_dot_696_comma__minus_11_dot_696_comma__minus_6_dot_24_comma__minus_6_dot_24_comma_0_dot_00419187544_comma_0_dot_00419187544 loc_bar__minus_9_bar__minus_2_bar_2_bar_60)
        (receptacleAtLocation BathtubBasin_1_dot_3992_comma_1_dot_3992_comma__minus_0_dot_54_comma__minus_0_dot_54_comma_0_dot_095999956_comma_0_dot_095999956 loc_bar__minus_3_bar__minus_1_bar_1_bar_60)
        (receptacleAtLocation Cabinet__minus_12_dot_37948324_comma__minus_12_dot_37948324_comma_1_dot_685427664_comma_1_dot_685427664_comma_1_dot_5627072_comma_1_dot_5627072 loc_bar__minus_10_bar__minus_2_bar_0_bar_60)
        (receptacleAtLocation Cabinet__minus_9_dot_220196_comma__minus_9_dot_220196_comma_1_dot_7006768_comma_1_dot_7006768_comma_1_dot_66141832_comma_1_dot_66141832 loc_bar__minus_8_bar__minus_2_bar_0_bar_60)
        (receptacleAtLocation Cabinet__minus_5_dot_9847126_comma__minus_5_dot_9847126_comma_1_dot_7006768_comma_1_dot_7006768_comma_1_dot_66141832_comma_1_dot_66141832 loc_bar__minus_9_bar__minus_2_bar_0_bar_60)
        (receptacleAtLocation Cabinet__minus_9_dot_144_comma__minus_9_dot_144_comma_1_dot_685427664_comma_1_dot_685427664_comma_1_dot_5627072_comma_1_dot_5627072 loc_bar__minus_6_bar__minus_2_bar_0_bar_60)
        (receptacleAtLocation Toilet__minus_4_dot_216_comma__minus_4_dot_216_comma_2_dot_212_comma_2_dot_212_comma_0_dot_00419187544_comma_0_dot_00419187544 loc_bar__minus_2_bar_2_bar_3_bar_15)
        (receptacleAtLocation TowelHolder__minus_1_dot_96_comma__minus_1_dot_96_comma_4_dot_03821756_comma_4_dot_03821756_comma_5_dot_412_comma_5_dot_412 loc_bar__minus_2_bar_2_bar_0_bar_30)
        (receptacleAtLocation CounterTop__minus_9_dot_192_comma__minus_9_dot_192_comma_2_dot_756_comma_2_dot_756_comma_3_dot_812_comma_3_dot_812 loc_bar__minus_11_bar_0_bar_0_bar_45)
        (receptacleAtLocation SinkBasin__minus_10_dot_6652_comma__minus_10_dot_6652_comma_2_dot_6772_comma_2_dot_6772_comma_3_dot_8468_comma_3_dot_8468 loc_bar__minus_10_bar_0_bar_0_bar_45)
        (receptacleAtLocation SinkBasin__minus_7_dot_6356_comma__minus_7_dot_6356_comma_2_dot_6772_comma_2_dot_6772_comma_3_dot_8468_comma_3_dot_8468 loc_bar__minus_7_bar_0_bar_0_bar_45)
        (receptacleAtLocation HandTowelHolder__minus_12_dot_53885268_comma__minus_12_dot_53885268_comma_2_dot_976_comma_2_dot_976_comma_6_dot_756_comma_6_dot_756 loc_bar__minus_11_bar_0_bar_0_bar_0)
        (objectAtLocation SprayBottle__minus_6_dot_57165144_comma__minus_6_dot_57165144_comma_2_dot_78491068_comma_2_dot_78491068_comma_0_dot_33033992_comma_0_dot_33033992 loc_bar__minus_7_bar_0_bar_0_bar_60)
        (objectAtLocation SprayBottle__minus_11_dot_25296_comma__minus_11_dot_25296_comma_2_dot_52678132_comma_2_dot_52678132_comma_0_dot_33033992_comma_0_dot_33033992 loc_bar__minus_11_bar_0_bar_0_bar_60)
        )


                (:goal
                    (and
                        (exists (?r - receptacle)
                            (exists (?o1 - object)
                                (and 
                                    (objectType ?o1 SprayBottleType) 
                                    (receptacleType ?r GarbageCanType)
                                    (inReceptacle ?o1 ?r)
                                    (exists (?o2 - object)
                                        (and
                                            (not (= ?o1 ?o2))
                                            (objectType ?o2 SprayBottleType)
                                            (receptacleType ?r GarbageCanType)
                                            (inReceptacle ?o2 ?r) 
                                        )
                                    )
                                )
                            )
                        )
                        (forall (?re - receptacle)
                            (not (opened ?re))
                        )
                    )
                )
            )
            