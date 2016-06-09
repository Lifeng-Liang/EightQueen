@echo off
cd /d "%~dp0"

haxe  -cp src -cs C:/Projects/Haxe/EightQueens/bin/ -main Main
haxe  -cp src -cpp C:/Projects/Haxe/EightQueens/cpp/ -main Main
haxe  -cp src -java C:/Projects/Haxe/EightQueens/java/ -main Main
haxe  -cp src -php C:/Projects/Haxe/EightQueens/php/ -main Main

haxe  -cp src -js C:/Projects/Haxe/EightQueens/EightQueens.js -main Main
haxe  -cp src -python C:/Projects/Haxe/EightQueens/EightQueens.py -main Main
haxe  -cp src -lua C:/Projects/Haxe/EightQueens/EightQueens.lua -main Main

