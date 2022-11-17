fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "eyss_menu"
description "Menu principal | Interface utilisateur réactive"
author "Eyss#0001"
version "1.0"

-- Ne pas toucher ! 

client_scripts {
    'client/*.lua',
    'shared/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua', -- Si vous utiliser Mysql-Async '@mysql-async/lib/MySQL.lua',
    'server/*.lua',
    'shared/*.lua',
}

ui_page "web/index.html"

files {
    'web/index.html',
    'web/script.js',
    'web/style.css',
    'web/img/*.png',
}

dependencies {
	'oxmysql', -- Si vous utiliser Mysql-Async 'mysql-async',
	'/onesync',
	'es_extended'
}