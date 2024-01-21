@echo off
call ..\bin\buildsuper_x64-win.bat .\4coder_fleury.cpp release

pushd ..\..\..\build

if not exist 4coder_fleury mkdir 4coder_fleury

copy ..\code\custom\4coder_fleury\custom_4coder.dll 4coder_fleury\custom_4coder.dll
copy ..\code\custom\4coder_fleury\custom_4coder.pdb 4coder_fleury\custom_4coder.pdb
:: TODO(achal): If bindings.4coder and config.4coder already exist don't copy them because we do not want to override user's settings with default settings.

if not exist ..\code\custom\4coder_fleury\bindings.4coder (
	echo Overwriting bindings..
	copy ..\code\custom\4coder_fleury\bindings.4coder 4coder_fleury\bindings.4coder
)
if not exist ..\code\custom\4coder_fleury\config.4coder (
	echo Overwriting config..
	copy ..\code\custom\4coder_fleury\config.4coder 4coder_fleury\config.4coder
)

popd