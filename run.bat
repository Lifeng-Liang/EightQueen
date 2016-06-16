@echo off
cd /d "%~dp0"

haxe  -cp src -cs bin/ -main Main
haxe  -cp src -cpp cpp/ -main Main
haxe  -cp src -java java/ -main Main
haxe  -cp src -php php/ -main Main

haxe  -cp src -js EightQueens.js -main Main
haxe  -cp src -python EightQueens.py -main Main
haxe  -cp src -lua EightQueens.lua -main Main

