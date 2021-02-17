for /l %%1 in (1,0,6) do (
	timeout /t 1
	adb shell input tap 555 1910
)