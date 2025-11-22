#!/usr/bin/bash

playerctl --follow metadata --format '{
	"title":"{{title}}",
	"artist":"{{artist}}",
	"album":"{{album}}",
	"artUrl":"{{mpris:artUrl}}",
	"status":"{{status}}"
}' | stdbuf -oL jq -c .
