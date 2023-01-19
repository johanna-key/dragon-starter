@echo off
rem rename files in to C:\Users\J.Schoeggl\DataZeiss\interactivThreshold\FeC3
echo "wir wollen das P_ ersetzen durch nichts"

p = C:\Users\J.Schoeggl\DataZeiss\interactivThreshold\FeC3
for /f: in %%p findstr "P_"           

echo %%p
