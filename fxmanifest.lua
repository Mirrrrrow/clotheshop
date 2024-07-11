fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author 'Mirow'
name 'clotheshop'
description 'Clothing pieces are now actually buyable.'
license 'GNU General Public License v3.0'
version '0.0.0'

dependencies {
    'es_extended',
    'oxmysql',
    'ox_lib'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua',
    'src/shared.lua'
}

client_scripts {
    'src/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'src/server.lua'
}

files {
    'data/**/*.lua',
    'locales/*.json'
}
