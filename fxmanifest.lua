fx_version 'adamant'
game 'gta5'
Author 'TribalWars'

dependencies {
    "PolyZone",
	"bt-target"
}

client_script {
  'client.lua',
  'locales/es.lua',
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua'

}

server_script {
	'server.lua'
}