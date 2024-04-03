fx_version 'cerulean'
games { 'gta5' }

author 'octo'
description 'Healing NPCs'
version '2.0'

client_scripts {
  '@es_extended/locale.lua',
  'locales/*.lua',
  'client.lua',
  'utils.lua',
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/*.lua',
  'server.lua'
}

shared_scripts {
  'config.lua'
}

shared_script '@es_extended/imports.lua'