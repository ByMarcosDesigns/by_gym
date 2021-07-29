fx_version 'cerulean'
games { 'gta5' }

author 'ByMarcosDesigns'
description 'ByShopsScript | Script para vender diferentes items'
version '1.0.0'

client_scripts {
    'config.lua',
    'client/*.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/*.lua'
}