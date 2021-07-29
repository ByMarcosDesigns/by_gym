Config = {}

Config.MemberShipPrice = 100

Config.EnableSkills = false
Config.NameExportSkill = 'by_skills'

Config.TextToGym = " [ ~r~E ~w~] to do "
Config.TextToShop = " [ ~r~E ~w~] to open the shop."

Config.Text3d = true

Config.TimerToRest = 60000 * 1 -- This is 1 minute

Config.Items = {
    {
        ['item'] = 'water',
        ['label'] = 'Water',
        ['price'] = 5,
    },
    {
        ['item'] = 'bread',
        ['label'] = 'Bread',
        ['price'] = 5,
    },
}

Config.Zones = {
    gym = {
        ['pos'] = vector3(-1195.134, -1577.538, 4.594848),
        ['dist'] = 2,
        ['type'] = 'shop',
        ['menu'] = {
            { label = 'Shop', value = 'itemS' },
            { label = 'Membership', value = 'ship' },
        }
    },
    arms = {
        ['pos'] = vector3(-1202.9837, -1565.1718, 4.6115),
        ['dist'] = 2,
        ['label'] = 'arms',
        ['type'] = 'gym',
        ['anim'] = 'world_human_muscle_free_weights',
        ['skill'] = { 
            {
                ['name'] = 'Strength',
                ['level'] = 2,
            },
        },
    },
    pushup = {
        ['pos'] = vector3(-1203.3242, -1570.6184, 4.6115),
        ['dist'] = 2,
        ['label'] = 'pushup',
        ['type'] = 'gym',
        ['anim'] = 'world_human_push_ups',
        ['skill'] = { 
            {
                ['name'] = 'Strength',
                ['level'] = 2,
            },
            {
                ['name'] = 'Stamina',
                ['level'] = 2,
            },
        },
    },
    yoga = {
        ['pos'] = vector3(-1204.7958, -1560.1906,4.6115),
        ['dist'] = 2,
        ['label'] = 'yoga',
        ['type'] = 'gym',
        ['anim'] = 'world_human_yoga',
        ['skill'] = { 
            {
                ['name'] = 'Lung Capacity',
                ['level'] = 2,
            },
        },
    },
    situps = {
        ['pos'] = vector3(-1206.1055, -1565.1589, 4.6115),
        ['dist'] = 2,
        ['label'] = 'situps',
        ['type'] = 'gym',
        ['anim'] = 'world_human_sit_ups',
        ['skill'] = { 
            {
                ['name'] = 'Strength',
                ['level'] = 2,
            },
        },
    },
    chins = {
        ['pos'] = vector3(-1200.1284, -1570.9903, 4.6115),
        ['dist'] = 2,
        ['label'] = 'chins',
        ['type'] = 'gym',
        ['anim'] = 'prop_human_muscle_chin_ups',
        ['skill'] = { 
            {
                ['name'] = 'Strength',
                ['level'] = 2,
            },
            {
                ['name'] = 'Capacidad Pulmonar',
                ['level'] = 2,
            },
        },
    },
}
