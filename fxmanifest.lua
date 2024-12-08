fx_version 'bodacious'
game 'gta5'
lua54 'yes'

author 'KVL Store'

server_script{
    'server.lua',
}

shared_script{
    'config.lua',
}

escrow_ignore {
    'config.lua',
    'server.lua',
    'readme/*.png',
    'readme/*.lua'
}